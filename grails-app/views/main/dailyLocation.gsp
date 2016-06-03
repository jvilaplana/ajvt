<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>AJVT | Force layout with images</title>
    <style>
    path.link {
        fill: none;
        stroke-width: 2px;
    }
    .node:not(:hover) .nodetext {
        display: none;
    }
    h1 { font-size: 36px; margin: 10px 0; text-transform: uppercase; font-weight: normal;}
    h2, h3 { font-size: 18px; margin: 5px 0 ; font-weight: normal;}
    header {padding: 20px; position: absolute; top: 0; left: 0;}
    a:link { color: #EE3124; text-decoration: none;}
    a:visited { color: #EE3124; }
    a:hover { color: #A4CD39; text-decoration: underline;}
    a:active { color: #EE3124; }
    </style>
</head>
<body>
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--12-col">
            <div class="mdl-typography--text-center">
                <div class="mdl-typography--display-1-color-contrast">
                    Daily Location Visualization
                </div>
            </div>
            <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--2-col">
                    <p class="mdl-typography--title">Day Selector</p>
                    <ul class="demo-list-icon mdl-list">
                        <li class="mdl-list__item">
                            <span class="mdl-list__item-primary-content">
                                <g:link action="dailyLocation" id="1">
                                    <%-- <img width="24" src="${assetPath(src: 'monday-calendar-page.png')}" /> --%>
                                    Monday
                                </g:link>
                            </span>
                        </li>
                        <li class="mdl-list__item">
                            <span class="mdl-list__item-primary-content">
                                <g:link action="dailyLocation" id="2">
                                    <%-- <img width="24" src="${assetPath(src: 'monday-calendar-page.png')}" /> --%>
                                    Tuesday
                                </g:link>
                            </span>
                        </li>
                        <li class="mdl-list__item">
                            <span class="mdl-list__item-primary-content">
                                <g:link action="dailyLocation" id="3">
                                    <%-- <img width="24" src="${assetPath(src: 'monday-calendar-page.png')}" /> --%>
                                    Wednesday
                                </g:link>
                            </span>
                        </li>
                        <li class="mdl-list__item">
                            <span class="mdl-list__item-primary-content">
                                <g:link action="dailyLocation" id="4">
                                    <%-- <img width="24" src="${assetPath(src: 'monday-calendar-page.png')}" /> --%>
                                    Thursday
                                </g:link>
                            </span>
                        </li>
                        <li class="mdl-list__item">
                            <span class="mdl-list__item-primary-content">
                                <g:link action="dailyLocation" id="5">
                                    <%-- <img width="24" src="${assetPath(src: 'monday-calendar-page.png')}" /> --%>
                                    Friday
                                </g:link>
                            </span>
                        </li>
                        <li class="mdl-list__item">
                            <span class="mdl-list__item-primary-content">
                                <g:link action="dailyLocation" id="6">
                                    <%-- <img width="24" src="${assetPath(src: 'monday-calendar-page.png')}" /> --%>
                                    Saturday
                                </g:link>
                            </span>
                        </li>
                        <li class="mdl-list__item">
                            <span class="mdl-list__item-primary-content">
                                <g:link action="dailyLocation" id="7">
                                    <%-- <img width="24" src="${assetPath(src: 'monday-calendar-page.png')}" /> --%>
                                    Sunday
                                </g:link>
                            </span>
                        </li>
              <h2 style="display: none;">Click to view their identity</h2>
            <h3 style="display: none;">And link to their web page!</h3>
        </div>
        <div class="mdl-cell mdl-cell--10-col">
            <section id="vis"></section>
        </div>
    </div>

    <script>
    $(function() {
        // some colour variables
        var tcBlack = "#130C0E";
        var curDay = 1;

        // rest of vars
        var w = 960,
        h = 600,
        maxNodeSize = 50,
        x_browser = 20,
        y_browser = 25,
        root;

        var vis;
        var force = d3.layout.force();

        vis = d3.select("#vis").append("svg").attr("width", w).attr("height", h);

        var url = "${createLink(controller:'main',action: 'graphData2', id: params?.id) }";

        d3.json(url, function(json) {
            root = json;
            root.fixed = true;
            root.x = w / 2;
            root.y = h / 4;

            // Build the path
            var defs = vis.insert("svg:defs")
            .data(["end"]);

            defs.enter().append("svg:path")
            .attr("d", "M0,-5L10,0L0,5");


            update();

            function collapse(d) {
                if (d.children) {
                    d._children = d.children;
                    d._children.forEach(collapse);
                    d.children = null;
                }
            }
            root.children.forEach(collapse);
            update();
        });


        function reloadDay() {
            curDay++;
            if(curDay > 7) curDay = 1;

            var url = "${createLink(controller:'main',action: 'graphData2') }/" + curDay;
            d3.json(url, function(json) {
                root = json;
                root.fixed = true;
                root.x = w / 2;
                root.y = h / 4;

                // Build the path
                var defs = vis.insert("svg:defs")
                .data(["end"]);

                defs.enter().append("svg:path")
                .attr("d", "M0,-5L10,0L0,5");


                update();

                function collapse(d) {
                    if (d.children) {
                        d._children = d.children;
                        d._children.forEach(collapse);
                        d.children = null;
                    }
                }
                root.children.forEach(collapse);
                update();
            });
        }

        $('#wololo').click(function() { reloadDay(); });


        /**
        *
        */
        function update() {
            var nodes = flatten(root),
            links = d3.layout.tree().links(nodes);

            // Restart the force layout.
            force.nodes(nodes)
            .links(links)
            .gravity(0.05)
            .charge(-1500)
            .linkDistance(300)
            .friction(0.5)
            .linkStrength(function(l, i) {return 1; })
            .size([w, h])
            .on("tick", tick)
            .start();


            var path = vis.selectAll("path.link")
            .data(links, function(d) { return d.target.id; });

            path.enter().insert("svg:path")
            .attr("class", "link")
            // .attr("marker-end", "url(#end)")
            .style("stroke", "#eee");

            // Exit any old paths.
            path.exit().remove();

            // Update the nodes…
            var node = vis.selectAll("g.node")
            .data(nodes, function(d) { return d.id; });


            // Enter any new nodes.
            var nodeEnter = node.enter().append("svg:g")
            .attr("class", "node")
            .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; })
            .on("click", click)
            .call(force.drag);

            // Append a circle
            nodeEnter.append("svg:circle")
            .attr("r", function(d) { return d.size || 4.5; })
            .style("fill", function (d) {
                if(d.size <= 20) return "#99c2ff";
                else if(d.size <= 50) return "#66a3ff";
                else if(d.size <= 80) return "#3385ff";
                else if(d.size <= 100) return "#0066ff";
            });

            // Append images
            var images = nodeEnter.append("svg:image")
            .attr("xlink:href",  function(d) {
                switch( d.img )
                {
                    case "home": return "${asset.assetPath(src: 'home.png')}";
                    case "work": return "${asset.assetPath(src: 'work.png')}";
                    case "university": return "${asset.assetPath(src: 'university.png')}";
                    case "eat": return "${asset.assetPath(src: 'eat.png')}";
                    case "monday": return "${asset.assetPath(src: 'monday-calendar-page.png')}";
                    case "tuesday": return "${asset.assetPath(src: 'tuesday-daily-calendar-page.png')}";
                    case "wednesday": return "${asset.assetPath(src: 'wednesday-calendar-daily-page.png')}";
                    case "thursday": return "${asset.assetPath(src: 'thursday-calendar-daily-page-interface-symbol.png')}";
                    case "friday": return "${asset.assetPath(src: 'friday-daily-calendar-page.png')}";
                    case "saturday": return "${asset.assetPath(src: 'saturday-calendar-daily-page-interface-symbol.png')}";
                    case "sunday": return "${asset.assetPath(src: 'sunday-daily-calendar-page.png')}";
                    case "locations": return "${asset.assetPath(src: 'university.png')}";


                    // De la taula de codis:

                    // Usual residence
                    case "1": return "${asset.assetPath(src: 'home.png')}";
                    // Unusual residence
                    case "2": return "${asset.assetPath(src: 'house-visiting.png')}";
                    // Family residence
                    case "3": return "${asset.assetPath(src: 'family-under-a-ceiling-outline.png')}";
                    // Friend residence
                    case "4": return "${asset.assetPath(src: 'party-in-house.png')}";
                    // University
                    case "5": return "${asset.assetPath(src: 'university.png')}";
                    // Workplace
                    case "6": return "${asset.assetPath(src: 'work.png')}";
                    // Leisure
                    case "7": return "${asset.assetPath(src: 'park.png')}";
                    // Commercial
                    case "8": return "${asset.assetPath(src: 'shopping-cart-empty-side-view.png')}";
                    // Street / transportation
                    case "9": return "${asset.assetPath(src: 'silhouette-crossing-street.png')}";
                    // Other
                    case "10": return "${asset.assetPath(src: 'global-map.png')}";
                }
            })
            .attr("x", function(d) { return -25;})
            .attr("y", function(d) { return -25;})
            .attr("height", 50)
            .attr("width", 50);

            // make the image grow a little on mouse over and add the text details on click
            var setEvents = images
            // Append info text
            .on( 'click', function (d) {
                d3.select("h1").html(d.name);
                d3.select("h2").html(d.desc);
                d3.select("h3").html ("Take me to " + "<a href='" + d.link + "' >"  + d.name + " web page ⇢"+ "</a>" );
            })

            .on( 'mouseenter', function() {
                // select element in current context
                d3.select( this )
                .transition()
                .attr("x", function(d) { return -30;})
                .attr("y", function(d) { return -30;})
                .attr("height", 60)
                .attr("width", 60);
            })
            // set back
            .on( 'mouseleave', function() {
                d3.select( this )
                .transition()
                .attr("x", function(d) { return -25;})
                .attr("y", function(d) { return -25;})
                .attr("height", 50)
                .attr("width", 50);
            });

            // Append location name on roll over next to the node as well
            nodeEnter.append("text")
            .attr("class", "nodetext")
            .attr("x", x_browser)
            .attr("y", y_browser +15)
            .attr("fill", tcBlack)
            .text(function(d) { return d.name; });


            // Exit any old nodes.
            node.exit().remove();


            // Re-select for update.
            path = vis.selectAll("path.link");
            node = vis.selectAll("g.node");



            function tick() {
                nodes[0].x = w / 2;
                nodes[0].y = h / 2;
                path.attr("d", function(d) {
                    var dx = d.target.x - d.source.x,
                    dy = d.target.y - d.source.y,
                    dr = Math.sqrt(dx * dx + dy * dy);
                    return   "M" + d.source.x + ","
                    + d.source.y
                    + "A" + dr + ","
                    + dr + " 0 0,1 "
                    + d.target.x + ","
                    + d.target.y;
                });
                node.attr("transform", nodeTransform);
            }
        }


        /**
        * Gives the coordinates of the border for keeping the nodes inside a frame
        * http://bl.ocks.org/mbostock/1129492
        */
        function nodeTransform(d) {
            d.x =  Math.max(maxNodeSize, Math.min(w - (d.imgwidth/2 || 16), d.x));
            d.y =  Math.max(maxNodeSize, Math.min(h - (d.imgheight/2 || 16), d.y));
            return "translate(" + d.x + "," + d.y + ")";
        }

        /**
        * Toggle children on click.
        */
        function click(d) {
            if (d.children) {
                d._children = d.children;
                d.children = null;
            } else {
                d.children = d._children;
                d._children = null;
            }

            update();
        }


        /**
        * Returns a list of all nodes under the root.
        */
        function flatten(root) {
            var nodes = [];
            var i = 0;

            function recurse(node) {
                if (node.children)
                node.children.forEach(recurse);
                if (!node.id)
                node.id = ++i;
                nodes.push(node);
            }

            recurse(root);
            return nodes;
        }

    });

    </script>
</div>
</div>
</body>
</html>
