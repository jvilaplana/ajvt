<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="layout" content="main" />
    <title>D3 Timeline Chart</title>
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/prism/0.0.1/prism.min.css">
    <link rel="stylesheet" href="http://rawgithub.com/Caged/d3-tip/master/examples/example-styles.css">
    <asset:stylesheet src="timeline-chart.css"/>
    <style>
    *, *:after, *:before {
        box-sizing: border-box;
    }

    #chart {
        width: 95%;
        height: 200px;
        background: #F2F6D0;
        opacity: 0.9;
        border-radius: 5px;
        border: 1px dotted #71697A;
    }

    #chart line {
        stroke: #71697A;
    }

    /* Override d3tip */

    .d3-tip {
        background: white;
        color: black;
    }

    /* Tiny Flex Grid */

    [flex] {
        display: flex;
    }
    [flex-fill] {
        flex: 1;
    }
    [flex-full-center] {
        align-items: center;
        justify-content: center;
    }
    [flex-direction=column] {
        flex-direction: column;
    }
    [flex-direction=row] {
        flex-direction: row;
    }
    [flex-size="40"] {
        flex: 40;
    }
    [flex-size="60"] {
        flex: 60;
    }

    </style>
</head>

<body>
    <div class="mdl-typography--text-center">
        <div class="mdl-typography--display-1-color-contrast">
            Time Series Visualization
        </div>
    </div>
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--12-col">
            <section flex flex-full-center>
                <div id="chart"></div>
            </section>
        </div>
    </div>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/prism/0.0.1/prism.min.js"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/d3/3.5.16/d3.min.js"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/d3-tip/0.6.7/d3-tip.min.js"></script>

    <script id="code">
    'use strict';

    var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

    function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

    var TimelineChart = function () {
        function TimelineChart(element, data, opts) {
            _classCallCheck(this, TimelineChart);

            var self = this;

            element.classList.add('timeline-chart');

            var options = this.extendOptions(opts);

            var allElements = data.reduce(function (agg, e) {
                return agg.concat(e.data);
            }, []);

            var minDt = d3.min(allElements, this.getPointMinDt);
            var maxDt = d3.max(allElements, this.getPointMaxDt);

            var elementWidth = options.width || element.clientWidth;
            var elementHeight = options.height || element.clientHeight;

            var margin = {
                top: 0,
                right: 0,
                bottom: 20,
                left: 0
            };

            var width = elementWidth - margin.left - margin.right;
            var height = elementHeight - margin.top - margin.bottom;

            var groupWidth = 200;

            var x = d3.time.scale().domain([minDt, maxDt]).range([groupWidth, width]);

            var xAxis = d3.svg.axis().scale(x).orient('bottom').tickSize(-height);

            var zoom = d3.behavior.zoom().x(x).on('zoom', zoomed);

            var svg = d3.select(element).append('svg').attr('width', width + margin.left + margin.right).attr('height', height + margin.top + margin.bottom).append('g').attr('transform', 'translate(' + margin.left + ',' + margin.top + ')').call(zoom);

            svg.append('defs').append('clipPath').attr('id', 'chart-content').append('rect').attr('x', groupWidth).attr('y', 0).attr('height', height).attr('width', width - groupWidth);

            svg.append('rect').attr('class', 'chart-bounds').attr('x', groupWidth).attr('y', 0).attr('height', height).attr('width', width - groupWidth);

            svg.append('g').attr('class', 'x axis').attr('transform', 'translate(0,' + height + ')').call(xAxis);

            var groupHeight = height / data.length;
            var groupSection = svg.selectAll('.group-section').data(data).enter().append('line').attr('class', 'group-section').attr('x1', 0).attr('x2', width).attr('y1', function (d, i) {
                return groupHeight * (i + 1);
            }).attr('y2', function (d, i) {
                return groupHeight * (i + 1);
            });

            var groupLabels = svg.selectAll('.group-label').data(data).enter()
              .append('svg:image')
                .attr('x', 5)
                .attr('y', function (d, i) {
                  return groupHeight * i + groupHeight / 2 - 16;
                })
                .attr('width', 32)
                .attr('height', 32)
                .attr("xlink:href", function(d, i) {
                  console.log(d.label);
                  if(d.label == "1") return "${assetPath(src: 'icons/home.svg')}";
                  else if(d.label == "2") return "${assetPath(src: 'house-visiting.png')}";
                  else if(d.label == "3") return "${assetPath(src: 'icons/family.svg')}";
                  else if(d.label == "4") return "${assetPath(src: 'party-in-house.png')}";
                  else if(d.label == "5") return "${assetPath(src: 'icons/university.svg')}";
                  else if(d.label == "6") return "${assetPath(src: 'work.png')}";
                  else if(d.label == "7") return "${assetPath(src: 'park.png')}";
                  else if(d.label == "8") return "${assetPath(src: 'icons/commercial.svg')}";
                  else if(d.label == "9") return "${assetPath(src: 'icons/street-transport.svg')}";
                  else return "${assetPath(src: 'global-map.png')}";
                });
                svg.selectAll('.group-label').data(data).enter()
              .append('text')
                .attr('class', 'group-label')
                .attr('x', 50)
                .attr('y', function (d, i) {
                  return groupHeight * i + groupHeight / 2 + 5.5;
                })
                .attr('dx', '0.5em').text(function (d) {
                  if(d.label == "1") return "Home";
                  else if(d.label == "2") return "Other home";
                  else if(d.label == "3") return "Family";
                  else if(d.label == "4") return "Friends";
                  else if(d.label == "5") return "University";
                  else if(d.label == "6") return "Workplace";
                  else if(d.label == "7") return "Leisure";
                  else if(d.label == "8") return "Commercial";
                  else if(d.label == "9") return "Street / Transport";
                  else return "Other";
                });


            var lineSection = svg.append('line').attr('x1', groupWidth).attr('x2', groupWidth).attr('y1', 0).attr('y2', height).attr('stroke', 'black');

            var groupIntervalItems = svg.selectAll('.group-interval-item').data(data).enter().append('g').attr('clip-path', 'url(#chart-content)').attr('class', 'item').attr('transform', function (d, i) {
                return 'translate(0, ' + groupHeight * i + ')';
            }).selectAll('.dot').data(function (d) {
                return d.data.filter(function (_) {
                    return _.type === TimelineChart.TYPE.INTERVAL;
                });
            }).enter();

            var intervalBarHeight = 0.8 * groupHeight;
            var intervalBarMargin = (groupHeight - intervalBarHeight) / 2;
            var intervals = groupIntervalItems.append('rect').attr('class', 'interval').attr('width', function (d) {
                return x(d.to) - x(d.from);
            }).attr('height', intervalBarHeight).attr('y', intervalBarMargin).attr('x', function (d) {
                return x(d.from);
            });

            var intervalTexts = groupIntervalItems.append('text').text(function (d) {
                return d.label;
            }).attr('fill', 'white').attr('class', 'interval-text').attr('y', groupHeight / 2 + 5).attr('x', function (d) {
                return x(d.from);
            });

            var groupDotItems = svg.selectAll('.group-dot-item').data(data).enter().append('g').attr('clip-path', 'url(#chart-content)').attr('class', 'item').attr('transform', function (d, i) {
                return 'translate(0, ' + groupHeight * i + ')';
            }).selectAll('.dot').data(function (d) {
                return d.data.filter(function (_) {
                    return _.type === TimelineChart.TYPE.POINT;
                });
            }).enter();

            var dots = groupDotItems.append('circle').attr('class', 'dot').attr('cx', function (d) {
                return x(d.at);
            }).attr('cy', groupHeight / 2).attr('r', 5);

            if (options.tip) {
                if (d3.tip) {
                    var tip = d3.tip().attr('class', 'd3-tip').html(options.tip);
                    svg.call(tip);
                    dots.on('mouseover', tip.show).on('mouseout', tip.hide);
                } else {
                    console.error('Please make sure you have d3.tip included as dependency (https://github.com/Caged/d3-tip)');
                }
            }

            zoomed();

            function zoomed() {
                if (self.onVizChangeFn && d3.event) {
                    self.onVizChangeFn.call(self, {
                        scale: d3.event.scale,
                        translate: d3.event.translate,
                        domain: x.domain()
                    });
                }

                svg.select('.x.axis').call(xAxis);

                svg.selectAll('circle.dot').attr('cx', function (d) {
                    return x(d.at);
                });
                svg.selectAll('rect.interval').attr('x', function (d) {
                    return x(d.from);
                }).attr('width', function (d) {
                    return x(d.to) - x(d.from);
                });

                svg.selectAll('.interval-text').attr('x', function (d) {
                    var positionData = getTextPositionData.call(this, d);
                    if (positionData.upToPosition - groupWidth - 10 < positionData.textWidth) {
                        return positionData.upToPosition;
                    } else if (positionData.xPosition < groupWidth && positionData.upToPosition > groupWidth) {
                        return groupWidth;
                    }
                    return positionData.xPosition;
                }).attr('text-anchor', function (d) {
                    var positionData = getTextPositionData.call(this, d);
                    if (positionData.upToPosition - groupWidth - 10 < positionData.textWidth) {
                        return 'end';
                    }
                    return 'start';
                }).attr('dx', function (d) {
                    var positionData = getTextPositionData.call(this, d);
                    if (positionData.upToPosition - groupWidth - 10 < positionData.textWidth) {
                        return '-0.5em';
                    }
                    return '0.5em';
                }).text(function (d) {
                    var positionData = getTextPositionData.call(this, d);
                    var percent = (positionData.width - options.textTruncateThreshold) / positionData.textWidth;
                    if (percent < 1) {
                        if (positionData.width > options.textTruncateThreshold) {
                            return d.label.substr(0, Math.floor(d.label.length * percent)) + '...';
                        } else {
                            return '';
                        }
                    }

                    return d.label;
                });

                function getTextPositionData(d) {
                    this.textSizeInPx = this.textSizeInPx || this.getComputedTextLength();
                    var from = x(d.from);
                    var to = x(d.to);
                    return {
                        xPosition: from,
                        upToPosition: to,
                        width: to - from,
                        textWidth: this.textSizeInPx
                    };
                }
            }
        }

        _createClass(TimelineChart, [{
            key: 'extendOptions',
            value: function extendOptions() {
                var ext = arguments.length <= 0 || arguments[0] === undefined ? {} : arguments[0];

                var defaultOptions = {
                    tip: undefined,
                    textTruncateThreshold: 30
                };
                Object.keys(ext).map(function (k) {
                    return defaultOptions[k] = ext[k];
                });
                return defaultOptions;
            }
        }, {
            key: 'getPointMinDt',
            value: function getPointMinDt(p) {
                return p.type === TimelineChart.TYPE.POINT ? p.at : p.from;
            }
        }, {
            key: 'getPointMaxDt',
            value: function getPointMaxDt(p) {
                return p.type === TimelineChart.TYPE.POINT ? p.at : p.to;
            }
        }, {
            key: 'onVizChange',
            value: function onVizChange(fn) {
                this.onVizChangeFn = fn;
                return this;
            }
        }]);

        return TimelineChart;
    }();

    TimelineChart.TYPE = {
        POINT: Symbol(),
        INTERVAL: Symbol()
    };
    //# sourceMappingURL=timeline-chart.js.map


        <g:applyCodec encodeAs="none">
          var myData = ${data};
        </g:applyCodec>

        const element = document.getElementById('chart');
        const data = [{
            label: '1',
            data: [{
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 23, 0, 0),
              to: new Date(2016, 4, 23, 7, 30)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 23, 21, 45),
              to: new Date(2016, 4, 23, 24, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 24, 0, 0),
              to: new Date(2016, 4, 24, 7, 30)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 24, 19, 30),
              to: new Date(2016, 4, 24, 24, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 25, 0, 0),
              to: new Date(2016, 4, 25, 13, 30)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 25, 19, 30),
              to: new Date(2016, 4, 25, 24, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 26, 0, 0),
              to: new Date(2016, 4, 26, 7, 30)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 26, 14, 45),
              to: new Date(2016, 4, 26, 24, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 27, 0, 0),
              to: new Date(2016, 4, 27, 13, 45)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 27, 18, 30),
              to: new Date(2016, 4, 27, 18, 45)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 27, 23, 15),
              to: new Date(2016, 4, 27, 24, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 28, 0, 0),
              to: new Date(2016, 4, 28, 15, 15)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 28, 21, 0),
              to: new Date(2016, 4, 28, 24, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 29, 0, 0),
              to: new Date(2016, 4, 29, 24, 0)
            }
            ]
        }, {
            label: '5',
            data: [{
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 23, 9, 0),
              to: new Date(2016, 4, 23, 21, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 24, 9, 0),
              to: new Date(2016, 4, 24, 18, 30)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 25, 15, 0),
              to: new Date(2016, 4, 25, 18, 30)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 26, 9, 0),
              to: new Date(2016, 4, 26, 14, 15)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 27, 15, 0),
              to: new Date(2016, 4, 27, 17, 30)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 28, 15, 15),
              to: new Date(2016, 4, 28, 18, 15)
            }
            ]
        }, {
            label: '8',
            data: [{
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 23, 18, 0),
              to: new Date(2016, 4, 23, 18, 30)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 27, 18, 45),
              to: new Date(2016, 4, 27, 23, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 28, 18, 15),
              to: new Date(2016, 4, 28, 21, 0)
            }
            ]
        }, {
            label: '9',
            data: [{
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 23, 7, 30),
              to: new Date(2016, 4, 23, 9, 15)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 23, 20, 45),
              to: new Date(2016, 4, 23, 22, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 24, 7, 30),
              to: new Date(2016, 4, 24, 9, 15)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 24, 18, 15),
              to: new Date(2016, 4, 24, 19, 45)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 25, 13, 30),
              to: new Date(2016, 4, 25, 15, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 25, 18, 15),
              to: new Date(2016, 4, 25, 19, 45)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 26, 7, 30),
              to: new Date(2016, 4, 26, 9, 15)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 26, 14, 15),
              to: new Date(2016, 4, 26, 14, 45)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 27, 13, 45),
              to: new Date(2016, 4, 27, 15, 0)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 27, 17, 15),
              to: new Date(2016, 4, 27, 18, 45)
            }, {
              type: TimelineChart.TYPE.INTERVAL,
              from: new Date(2016, 4, 27, 23, 0),
              to: new Date(2016, 4, 27, 23, 15)
            }
            ]
        }];

        const timeline = new TimelineChart(element, data, {
            tip: function(d) {
                return d.at || `&#36;{d.from}<br>&#36;{d.to}`;
            }
        }).onVizChange(e => console.log(e));
    </script>

</body>

</html>
