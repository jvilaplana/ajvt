<!doctype html>
<html>
<head>
    <meta name="layout" content="main" />
    <style>
    .dalo-card > .mdl-card__title {
        height: 176px;
        background: url('${asset.assetPath(src: 'previews/dailyLocation_preview.png')}') center / cover;
    }
    .tise-card > .mdl-card__title {
        height: 176px;
        background: url('${asset.assetPath(src: 'previews/timeSeries_preview.png')}') center / cover;
    }
    .loev-card > .mdl-card__title {
        height: 176px;
        background: url('${asset.assetPath(src: 'previews/locationEvolution_preview.png')}') center / cover;
    }
    .mdl-card__supporting-text {
        min-height: 105px;
    }
    </style>
</head>
<body>
    <div class="mdl-typography--text-center">
        <div class="mdl-typography--display-1-color-contrast">
            Activity Diary Visualization Tool
        </div>
    </div>
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--2-col">
            <p class="mdl-typography--title">
                About
            </p>
            <p class="mdl-typography--body-1 mdl-typography--text-justify">
                This tool allows to visualize data from an activity diary where multiple participants have logged their location information in 15-minute interavals.
            </p>
        </div>
        <div class="mdl-cell mdl-cell--10-col">
            <p class="mdl-typography--title">
                Visualizations
            </p>
            <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--4-col">
                    <div class="dalo-card mdl-card mdl-shadow--2dp">
                        <div class="mdl-card__title">
                            <h2 class="mdl-card__title-text">Daily Location</h2>
                        </div>
                        <div class="mdl-card__supporting-text mdl-typography--text-justify">
                            For each day, a graph representation where each node corresponds to a location and has a size proportional to the time spent in that particular location.
                        </div>
                        <div class="mdl-card__actions mdl-card--border">
                            <g:link controller="main" action="dailyLocation" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                Access visualization
                            </g:link>
                        </div>
                    </div>
                </div>
                <div class="mdl-cell mdl-cell--4-col">
                    <div class="tise-card mdl-card mdl-shadow--2dp">
                        <div class="mdl-card__title">
                            <h2 class="mdl-card__title-text">Time Series</h2>
                        </div>
                        <div class="mdl-card__supporting-text mdl-typography--text-justify">
                            See in a single zoomable visualization all the locations from Monday to Sunday in an horizontal time series.
                        </div>
                        <div class="mdl-card__actions mdl-card--border">
                            <g:link controller="main" action="timeSeries" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                Access visualization
                            </g:link>
                        </div>
                    </div>
                </div>
                <div class="mdl-cell mdl-cell--4-col">
                    <div class="loev-card mdl-card mdl-shadow--2dp">
                        <div class="mdl-card__title">
                            <h2 class="mdl-card__title-text">Location Evolution</h2>
                        </div>
                        <div class="mdl-card__supporting-text mdl-typography--text-justify">
                            An animated 4D visualization that allows to easily see how the user moves through the different locations as time passes.
                        </div>
                        <div class="mdl-card__actions mdl-card--border">
                            <g:link controller="main" action="locationEvolution" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                                Access visualization
                            </g:link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
