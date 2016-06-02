
<!doctype html>
<html>
<head>
  <title>Graph 3D Axis Ticks</title>
  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">

  <style>
    #mygraph {
      background-color: #FBF8EF;
      border: 1px dotted black;
      width: 95%;
      margin: auto;
      height: 600px;
    }
  </style>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.min.css">

  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.min.js"></script>


  <script type="text/javascript">
  $(function() {
    var data = null;
    var graph = null;

    function custom(x, y) {
      return (-Math.sin(x/Math.PI) * Math.cos(y/Math.PI) * 10 + 10) * 1000;
    }

    // Called when the Visualization API is loaded.
    function drawVisualization() {
      //var style = document.getElementById('style').value;
      var style = 'bar';
      var withValue = ['bar-color', 'bar-size', 'dot-size', 'dot-color'].indexOf(style) != -1;

      // Create and populate a data table.
      data = new vis.DataSet();

      // create some nice looking data with sin/cos
      var steps = 5;  // number of datapoints will be steps*steps
      var axisMax = 10;
      var axisStep = axisMax / steps;
      for (var x = 0; x <= axisMax; x+=axisStep) {
        for (var y = 0; y <= axisMax; y+=axisStep) {
          var z = custom(x,y);
          if (withValue) {
            var value = (y - x);
            data.add({x:x, y:y, z: z, style:value});
          }
          else {
            data.add({x:x, y:y, z: z});
          }
        }
      }

      data2 = new vis.DataSet();
      data2.add({x:23, y:0, z: 38});
      data2.add({x:23, y:1, z: 12});
      data2.add({x:23, y:2, z: 47});
      data2.add({x:23, y:2, z: 47});

      data2.add({x:24, y:0, z: 38});
      data2.add({x:24, y:1, z: 12});
      data2.add({x:24, y:2, z: 47});

      data3 = new vis.DataSet();

      <g:applyCodec encodeAs="none">
        var rawData = ${data};
      </g:applyCodec>

      for(var i in rawData) {
        data3.add({x: rawData[i].x, y: rawData[i].y, z: rawData[i].z, filter: rawData[i].t});
      }



      // specify options
      var options = {
        autoResize: true,
        width: '90%',
        height: '90%',
        cameraPosition: {horizontal: 1.0, vertical: 0.5, distance: 2},
        //width:  '600px',
        //height: '600px',
        style: style,
        yCenter: '35%',
        showPerspective: true,
        showGrid: true,
        showShadow: true,
        xStep: 1,
        yStep: 1,
        zStep: 12,
        zMin: 0,
        zMax: 96,
        xLabel: 'Day of week',
        yLabel: 'Location',
        zLabel: '# Hours',
        filterLabel: 'Time',
        axisColor: 'black',
        animationInterval: 100, // milliseconds
        animationPreload: true,
        showAnimationControls: true,
        animationAutoStart: true,

        // Option tooltip can be true, false, or a function returning a string with HTML contents
        //tooltip: true,
        tooltip: function (point) {
          // parameter point contains properties x, y, z
          var hours = Math.floor((point.z * 15) / 60);
          var minutes = (point.z * 15) % 60;
          if(hours < 10) hours = "0" + hours;
          if(minutes < 10) minutes = "0" + minutes;
          return '# Hours: <b>' + hours + ':' + minutes + '</b>';
        },

        xValueLabel: function(value) {
            return vis.moment().add(value + 2, 'days').format('dddd');
        },

        yValueLabel: function(value) {
            if(value == 0) return 'Home';
            else if(value == 1) return 'Unusual Home';
            else if(value == 2) return 'Family';
            else if(value == 3) return 'Friends';
            else if(value == 4) return 'University';
            else if(value == 5) return 'Workplace';
            else if(value == 6) return 'Leisure';
            else if(value == 7) return 'Commercial';
            else if(value == 8) return 'Street / Transport';
            else if(value == 9) return 'Other';
            else return '';
        },

        zValueLabel: function(value) {
            var hours = Math.floor((value * 15) / 60);
            var minutes = (value * 15) % 60;
            return hours + ':' + minutes;
        },

        filterValueLabel: function(value) {
            var hours = Math.floor((value * 15) / 60);
            var minutes = (value * 15) % 60;
            return hours + ':' + minutes;
        },

        keepAspectRatio: true,
        verticalRatio: 0.5
      };

      var camera = graph ? graph.getCameraPosition() : null;

      // create our graph
      var container = document.getElementById('mygraph');
      graph = new vis.Graph3d(container, data3, options);

      if (camera) graph.setCameraPosition(camera); // restore camera position

      document.getElementById('style').onchange = drawVisualization;
    }
    drawVisualization();
  });
  </script>
</head>

<body>
    <div class="mdl-typography--text-center">
        <div class="mdl-typography--display-1-color-contrast">Location evolution</div>
    </div>
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--12-col">
          <p class="mdl-typography--title">Information</p>
          <p class="mdl-typography--body-1">
              This visualization shows the evolution of the location of a single person.
          </p>
          <p class="mdl-typography--body-1">
              The z axis (# Hours) represents the total number of hours the person has spent in a location (y axis) during a day (x axis).
          </p>
          <p class="mdl-typography--body-1">
              The animation starts at 00:00 hours and ends at 24:00 hours. Each animation frame corresponds to a 15 minute increase.
          </p>
          <p class="mdl-typography--body-1">
              You can pause the animation and move forward and backwards using the controls at the bottom. You can also zoom in / out using the mouse wheel and rotate the camera by holding the left mouse button. Click a bar to see its exact value.
          </p>
          <p class="mdl-typography--body-1">
            Click this button to scroll down to the chart
            <a href="#mygraph">
            <button class="mdl-button mdl-button--colored mdl-js-button mdl-button--fab mdl-js-ripple-effect">
              <i class="material-icons">expand_more</i>
            </button>
          </a>
          <%--
          <p>
              <div class="mdl-selectfield mdl-js-selectfield">
                  <label class="mdl-selectfield__label" for="gender">Style:</label>
                  <select id="style" class="mdl-selectfield__select">
                      <option value="bar">bar</option>
                      <option value="bar-color">bar-color</option>
                      <option value="dot">dot</option>
                      <option value="grid">grid</option>
                      <option value="line">line</option>
                      <option value="surface">surface</option>
                  </select>
              </div>
          </p>
          --%>
          <div id="mygraph"></div>
          <div id="info"></div>
        </div>
    </div>
</body>
</html>
