<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <style>
    #chart {
      margin-left: -40px;
      height: 506px;
    }
    .node {
      stroke: #fff;
      stroke-width: 1.5px;
    }
    .link {
      stroke: #999;
      stroke-opacity: .6;
    }
    </style>
    <script type="text/javascript">
    $(function() {
      var width = 960, height = 500;
      var color = d3.scale.category20();
      var force = d3.layout.force()
        .charge(-120)
        .linkDistance(100)
        .friction(0.5)
        .size([width, height]);

      var svg = d3.select("#chart").append("svg")
        .attr("width", width)
        .attr("height", height);

      var url = "${createLink(controller:'main',action: 'graphData') }";
      d3.json(url, function(error, graph) {
        if (error) throw error;

      force
        .nodes(graph.nodes)
        .links(graph.links)
        .linkDistance(function(d) { return d.value * 20; })
        .start();

      var link = svg.selectAll(".link")
        .data(graph.links)
        .enter().append("line")
          .attr("class", "link")
          .style("stroke-width", function(d) { return Math.sqrt(d.value); });

      var defs = svg.append('svg:defs');

      defs.append("svg:pattern")
        .attr("id", "home")
        .attr("width", 40)
        .attr("height", 40)
        //.attr("patternUnits", "userSpaceOnUse")
        .append("svg:image")
        .attr("xlink:href", '${asset.assetPath(src: 'home.png')}')
        .attr("width", 40)
        .attr("height", 40)
        .attr("x", 0)
        .attr("y", 0);

      defs.append("svg:pattern")
        .attr("id", "work")
        .attr("width", 40)
        .attr("height", 40)
        //.attr("patternUnits", "userSpaceOnUse")
        .append("svg:image")
        .attr("xlink:href", '${asset.assetPath(src: 'work.png')}')
        .attr("patternUnits", "objectBoundingBox")
        .attr("width", 40)
        .attr("height", 40)
        .attr("x", 0)
        .attr("y", 0);

      defs.append("svg:pattern")
        .attr("id", "eat")
        .attr("width", 40)
        .attr("height", 40)
        //.attr("patternUnits", "userSpaceOnUse")
        .append("svg:image")
        .attr("xlink:href", '${asset.assetPath(src: 'eat.png')}')
        .attr("width", 40)
        .attr("height", 40)
        .attr("x", 0)
        .attr("y", 0);

      defs.append("svg:pattern")
        .attr("id", "university")
        .attr("width", 40)
        .attr("height", 40)
        //.attr("patternUnits", "userSpaceOnUse")
        .append("svg:image")
        .attr("xlink:href", '${asset.assetPath(src: 'university.png')}')
        .attr("width", 40)
        .attr("height", 40)
        .attr("x", 0)
        .attr("y", 0);

      var node = svg.selectAll("g.node")
        .data(graph.nodes)
        .enter().append("svg:g")
        //.attr("xlink:href",  function(d) { return d.img;})
        //.style("fill", function(d) { return url('#image' + d.group); })
        //.style("fill", "url('#home')")
        //.style("fill", function(d) { return 'url(#' + d.img + ')'; })
        .attr("class", "node")
        .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; })
        //.attr("r", function(d) { return d.value * 20; })
        //.style("fill", function(d) { return color(d.group); })
        .call(force.drag);

      node.append("svg:circle")
        .attr("r", function(d) { return d.value * 10; })
        .style("fill", "#eee");

      // Append images
      var images = node.append("svg:image")
        .attr("xlink:href",  function(d) {
          switch( d.img )
          {
            case "home": return "${asset.assetPath(src: 'home.png')}";
            case "work": return "${asset.assetPath(src: 'work.png')}";
            case "university": return "${asset.assetPath(src: 'university.png')}";
            case "eat": return "${asset.assetPath(src: 'eat.png')}";
          }
        })
        //.attr("transform", function(d) { return "translate(" + d.value + "," + d.value + ")"; });
        .attr("x", function(d) { return -1 * (d.value * 10) / 2;})
        .attr("y", function(d) { return -1 * (d.value * 10) / 2;})
        .attr("height", function(d) { return d.value * 10; })
        .attr("width", function(d) { return d.value * 10; });

      node.append("title")
          .text(function(d) { return d.name; });

      force.on("tick", function() {
        link.attr("x1", function(d) { return d.source.x; })
            .attr("y1", function(d) { return d.source.y; })
            .attr("x2", function(d) { return d.target.x; })
            .attr("y2", function(d) { return d.target.y; });

        node.attr("cx", function(d) { return d.x; })
            .attr("cy", function(d) { return d.y; });
      });
    });
});
    </script>
  </head>
  <body>
      <div id="chart"></div>
  </body>
</html>
