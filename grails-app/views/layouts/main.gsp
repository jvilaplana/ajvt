<!doctype html>

<!--
  AJVT Project webpage
  Copyright 2016 Jordi Vilaplana. All rights reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License
-->

<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><g:layoutTitle default="${g.message(code: 'layout.main.title')}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.5/material.indigo-pink.min.css">
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.5/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>
<body>
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        <div class="android-header mdl-layout__header mdl-layout__header--waterfall">
            <div class="mdl-layout__header-row">
                <span class="android-title mdl-layout-title">
                    <img class="ajvt-logo-image" src="${resource(dir: 'images', file: 'ajvt_logo.png')}" alt="AJVT Logo" />
                </span>
                <!-- Add spacer, to align navigation to the right in desktop -->
                <div class="android-header-spacer mdl-layout-spacer"></div>
                <!-- Navigation -->
                <div class="android-navigation-container">
                    <nav class="android-navigation mdl-navigation">
                        <g:link controller="main" action="index" class="${controllerName.equals("main") && actionName.equals("index") ? "is_nav_active" : ""} mdl-navigation__link mdl-typography--text-uppercase">
                            <g:message code="layout.main.home" />
                        </g:link>
                        <g:link controller="main" action="dailyLocation" class="${controllerName.equals("main") && actionName.equals("dailyLocation") ? "is_nav_active" : ""} mdl-navigation__link mdl-typography--text-uppercase">
                            <g:message code="layout.main.dailyLocation" />
                        </g:link>
                        <g:link controller="main" action="timeSeries" class="${controllerName.equals("main") && actionName.equals("timeSeries") ? "is_nav_active" : ""} mdl-navigation__link mdl-typography--text-uppercase">
                            <g:message code="layout.main.timeSeries" />
                        </g:link>
                        <g:link controller="main" action="locationEvolution" class="${controllerName.equals("main") && actionName.equals("locationEvolution") ? "is_nav_active" : ""} mdl-navigation__link mdl-typography--text-uppercase">
                            <g:message code="layout.main.locationEvolution" />
                        </g:link>
                    </nav>
                </div>
                <span class="android-mobile-title mdl-layout-title">
                    <img class="ajvt-logo-image" src="${resource(dir: 'images', file: 'ajvt_logo.png')}" alt="AJVT Logo">
                </span>
            </div>
        </div>
        <div class="android-drawer mdl-layout__drawer">
            <span class="mdl-layout-title">
                <img class="ajvt-logo-image" style="margin-top: 90px;" src="${resource(dir: 'images', file: 'ajvt_logo.png')}">
            </span>
            <nav class="mdl-navigation">
                <g:link controller="main" action="index" class="mdl-navigation__link  mdl-typography--text-uppercase">
                    <g:message code="layout.main.home" />
                </g:link>
                <g:link controller="main" action="dailyLocation" class="mdl-navigation__link mdl-typography--text-uppercase">
                    <g:message code="layout.main.dailyLocation" />
                </g:link>
                <g:link controller="main" action="timeSeries" class="mdl-navigation__link mdl-typography--text-uppercase">
                    <g:message code="layout.main.timeSeries" />
                </g:link>
                <g:link controller="main" action="locationEvolution" class="mdl-navigation__link mdl-typography--text-uppercase">
                    <g:message code="layout.main.locationEvolution" />
                </g:link>
            </nav>
        </div>
        <div class="android-content mdl-layout__content">
            <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--12-col">
                    <g:layoutBody/>
                </div>
            </div>
            <footer class="android-footer mdl-mega-footer">
                <div class="mdl-mega-footer--top-section">
                    <div class="mdl-mega-footer--right-section">
                    </div>
                </div>
                <div class="mdl-mega-footer--middle-section">
                    <div style="display: block;">
                        <img src="${resource(dir: 'images', file: 'udl.png')}" alt="UdL" />
                        <span class="mdl-typography--font-light">
                            <g:message code="layout.main.udl" />
                        </span>
                    </div>
                </div>
                <div class="mdl-mega-footer--bottom-section">
                    <p class="mdl-typography--font-light">
                        Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a>
                    </p>
                    <p class="mdl-typography--font-light">
                        from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a>
                    </p>
                    <p class="mdl-typography--font-light">
                        is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a>
                    </p>
                </div>
            </footer>
        </div>
    </div>
</body>
</html>
