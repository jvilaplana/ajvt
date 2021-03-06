package com.jordiv.ajvt

import grails.converters.JSON

class MainController {

    def index() {

      // [ DAY, TIME, WHAT, WHAT, WHAT, WHO, WHO, WHO, WHERE, WHERE, WHERE]
      def data = [
        [1, '00:00', '1', '', '', '1', '', '', '2', '', ''],
        [1, '00:15', '1', '', '', '1', '', '', '2', '', ''],
        [1, '00:30', '2', '', '', '5', '', '', '7', '', '']
      ]

      render(view: "index", model: ['data': data as JSON])
    }

    def data() {
      def data = [
        ["name":"Angola","region":"Sub-Saharan Africa","income":[[1800,359.93],[1820,359.93],[1913,556.12],[1950,3363.02],[1951,3440.9],[1952,3520.61],[1953,3598.81],[1954,3450.82],[1955,3672.08],[1956,3549.04],[1957,3827.94],[1958,3966.42],[1959,3917.76],[1960,4006.21],[1961,4463.83],[1962,4269.28],[1963,4413.6],[1964,4826.49],[1965,5102.21],[1966,5308.14],[1967,5522.78],[1968,5346.63],[1969,5408.12],[1970,5651.88],[1971,5526.21],[1972,5473.29],[1973,5722.02],[1974,5470.21],[1975,3430.85],[1976,3050.32],[1977,3008.65],[1978,3070.82],[1979,3064.89],[1980,3074.75],[1981,2953.41],[1982,2756.95],[1983,2584.56],[1984,2527.47],[1985,2492.83],[1986,2220.61],[1987,2430.21],[1988,2728.53],[1989,2730.56],[1990,2777.42],[1991,2730.85],[1992,2627.85],[1993,1869.92],[1994,1851.45],[1995,1989.02],[1996,2157.35],[1997,2277.14],[1998,2384.48],[1999,2417.18],[2000,2446.65],[2001,2479.69],[2002,2773.29],[2003,2785.39],[2004,3007.11],[2005,3533],[2006,4069.56],[2007,4755.46],[2008,5228.74],[2009,5055.59]],"population":[[1800,1567028],[1820,1567028],[1940,3738000],[1950,4117617],[1951,4173095],[1952,4232095],[1953,4293840],[1954,4357527],[1955,4423223],[1956,4490992],[1957,4561361],[1958,4635885],[1959,4714676],[1960,4797344],[1961,4752489],[1962,4826015],[1963,4919586],[1964,5026044],[1965,5134818],[1966,5201250],[1967,5247469],[1968,5350384],[1969,5471641],[1970,5605626],[1971,5752775],[1972,5894858],[1973,6025841],[1974,5986432],[1975,5884241],[1976,5942225],[1977,6162675],[1978,6285716],[1979,6451227],[1980,6741465],[1981,6877697],[1982,7016384],[1983,7238214],[1984,7439658],[1985,7581504],[1986,7744932],[1987,7874230],[1988,8018724],[1989,8148595],[1990,8290856],[1991,8490763],[1992,8735988],[1993,8961438],[1994,9170032],[1995,9421477],[1996,9660081],[1997,9875024],[1998,10071442],[1999,10263229],[2000,10442812],[2001,10623424],[2002,10866106],[2003,11186202],[2004,11521432],[2005,11827315],[2006,12127071],[2007,12420476],[2008,12707546]],"lifeExpectancy":[[1800,26.98],[1940,26.98],[1950,29.22],[1951,29.42],[1952,29.81],[1953,30.21],[1954,30.6],[1955,31],[1956,31.4],[1957,31.8],[1958,32.2],[1959,32.6],[1960,33],[1961,33.4],[1962,33.8],[1963,34.2],[1964,34.6],[1965,35],[1966,35.4],[1967,35.8],[1968,36.2],[1969,36.6],[1970,37],[1971,37.41],[1972,37.83],[1973,38.26],[1974,38.68],[1975,39.09],[1976,39.46],[1977,39.8],[1978,40.1],[1979,40.34],[1980,40.55],[1981,40.71],[1982,40.85],[1983,40.97],[1984,41.08],[1985,41.2],[1986,41.33],[1987,41.48],[1988,41.64],[1989,41.81],[1990,41.99],[1991,42.16],[1992,42.32],[1993,42.46],[1994,42.59],[1995,42.7],[1996,42.82],[1997,42.96],[1998,43.12],[1999,43.32],[2000,43.56],[2001,43.86],[2002,44.22],[2003,44.61],[2004,45.05],[2005,45.52],[2006,46.02],[2007,46.54],[2008,47.06],[2009,47.58]]],
        ["name":"Benin","region":"Sub-Saharan Africa","income":[[1800,553.72],[1820,553.72],[1913,855.53],[1950,1104.47],[1951,1083.57],[1952,1062.75],[1953,1012.84],[1954,1021.29],[1955,1000.66],[1956,980.06],[1957,959.6],[1958,974.04],[1959,988.88],[1960,996.93],[1961,1006.39],[1962,949.5],[1963,970.34],[1964,1012.25],[1965,1039.34],[1966,1051.67],[1967,1035.83],[1968,1048.78],[1969,1052.8],[1970,1047.17],[1971,1024.93],[1972,1085.8],[1973,1081.87],[1974,973.64],[1975,987.96],[1976,1002.19],[1977,1029.16],[1978,1032.01],[1979,1083.17],[1980,1154.23],[1981,1186.7],[1982,1277.9],[1983,1187.14],[1984,1243.82],[1985,1297.16],[1986,1285.08],[1987,1225.86],[1988,1222.9],[1989,1158.34],[1990,1165.47],[1991,1181.65],[1992,1191.21],[1993,1177.91],[1994,1168.53],[1995,1176.67],[1996,1202.15],[1997,1232.98],[1998,1251.88],[1999,1272.8],[2000,1307.57],[2001,1333.3],[2002,1372.88],[2003,1386.05],[2004,1389.13],[2005,1390],[2006,1402.94],[2007,1428.15],[2008,1459.07],[2009,1457.57]],"population":[[1800,636559],[1820,636559],[1950,1672661],[1951,1704916],[1952,1738315],[1953,1772899],[1954,1808895],[1955,1846175],[1956,1884978],[1957,1925173],[1958,1966816],[1959,2010163],[1960,2055083],[1961,2101846],[1962,2151895],[1963,2202775],[1964,2255760],[1965,2310714],[1966,2367951],[1967,2427334],[1968,2488957],[1969,2553162],[1970,2619809],[1971,2689271],[1972,2761407],[1973,2836325],[1974,2914439],[1975,2995605],[1976,3080268],[1977,3168267],[1978,3259760],[1979,3354798],[1980,3444361],[1981,3540043],[1982,3641603],[1983,3748839],[1984,3861680],[1985,3982013],[1986,4110035],[1987,4243788],[1988,4382448],[1989,4526250],[1990,4676077],[1991,4828814],[1992,4981671],[1993,5214220],[1994,5487359],[1995,5700089],[1996,5886094],[1997,6066080],[1998,6248686],[1999,6435871],[2000,6627964],[2001,6824931],[2002,7026113],[2003,7230693],[2004,7438437],[2005,7649360],[2006,7862944],[2007,8078314],[2008,8294941]],"lifeExpectancy":[[1800,31],[1944,31],[1950,36.53],[1951,36.73],[1952,37.15],[1953,37.58],[1954,38.01],[1955,38.45],[1956,38.9],[1957,39.35],[1958,39.8],[1959,40.26],[1960,40.72],[1961,41.18],[1962,41.64],[1963,42.1],[1964,42.55],[1965,43.01],[1966,43.47],[1967,43.95],[1968,44.43],[1969,44.93],[1970,45.45],[1971,45.99],[1972,46.55],[1973,47.12],[1974,47.69],[1975,48.25],[1976,48.79],[1977,49.29],[1978,49.75],[1979,50.17],[1980,50.54],[1981,50.87],[1982,51.15],[1983,51.42],[1984,51.68],[1985,51.94],[1986,52.24],[1987,52.57],[1988,52.95],[1989,53.37],[1990,53.84],[1991,54.34],[1992,54.86],[1993,55.38],[1994,55.89],[1995,56.38],[1996,56.84],[1997,57.26],[1998,57.64],[1999,58],[2000,58.34],[2001,58.68],[2002,59.02],[2003,59.38],[2004,59.77],[2005,60.17],[2006,60.6],[2007,61.03],[2008,61.47],[2009,61.89]]],
        ["name":"Botswana","region":"Sub-Saharan Africa","income":[[1800,407.36],[1820,407.36],[1913,629.4],[1950,825.25],[1951,840.94],[1952,851.24],[1953,865.86],[1954,880.5],[1955,893.58],[1956,905.91],[1957,918.23],[1958,929.05],[1959,944.14],[1960,953.26],[1961,971.44],[1962,983.65],[1963,999.69],[1964,1018.75],[1965,1034.37],[1966,1119.01],[1967,1214.71],[1968,1319.18],[1969,1424.21],[1970,1532.71],[1971,1769.34],[1972,2263.61],[1973,2658.43],[1974,3077.33],[1975,2897.18],[1976,3271.32],[1977,3214.86],[1978,3640.34],[1979,3818.4],[1980,4178.48],[1981,4399.13],[1982,4551.14],[1983,5079.53],[1984,5450.44],[1985,5656.04],[1986,5889.64],[1987,6205.88],[1988,6959.66],[1989,7619.62],[1990,7829.23],[1991,7964.58],[1992,7954.11],[1993,7860.65],[1994,7898.05],[1995,8030.48],[1996,8281.92],[1997,8647.14],[1998,8990.98],[1999,9416.67],[2000,10107.99],[2001,10543.61],[2002,11003.61],[2003,11391.09],[2004,11722.59],[2005,12057],[2006,12574.18],[2007,13010.7],[2008,13240.06],[2009,12282.28]],"population":[[1800,121000],[1904,121000],[1911,125000],[1921,153000],[1936,266000],[1946,296000],[1950,430413],[1951,436320],[1952,442308],[1953,448377],[1954,454640],[1955,461100],[1956,467765],[1957,474639],[1958,481731],[1959,489080],[1960,496695],[1961,504585],[1962,512764],[1963,521237],[1964,529966],[1965,538100],[1966,545965],[1967,553541],[1968,561941],[1969,571874],[1970,583999],[1971,599647],[1972,619351],[1973,643076],[1974,671769],[1975,704591],[1976,741273],[1977,781472],[1978,822247],[1979,862602],[1980,900476],[1981,934438],[1982,970347],[1983,1006466],[1984,1042702],[1985,1078902],[1986,1114934],[1987,1151184],[1988,1188137],[1989,1225684],[1990,1263643],[1991,1301796],[1992,1342614],[1993,1385749],[1994,1427426],[1995,1466989],[1996,1503652],[1997,1536536],[1998,1564950],[1999,1588505],[2000,1607069],[2001,1620848],[2002,1630347],[2003,1636213],[2004,1639231],[2005,1640115],[2006,1639833],[2007,1639131],[2008,1638393]],"lifeExpectancy":[[1800,33.6],[1945,33.6],[1950,46.82],[1951,47.02],[1952,47.43],[1953,47.84],[1954,48.25],[1955,48.65],[1956,49.05],[1957,49.45],[1958,49.85],[1959,50.23],[1960,50.61],[1961,50.98],[1962,51.33],[1963,51.68],[1964,52.02],[1965,52.37],[1966,52.74],[1967,53.13],[1968,53.57],[1969,54.04],[1970,54.56],[1971,55.13],[1972,55.75],[1973,56.39],[1974,57.04],[1975,57.7],[1976,58.33],[1977,58.93],[1978,59.48],[1979,59.99],[1980,60.46],[1981,60.92],[1982,61.38],[1983,61.85],[1984,62.31],[1985,62.77],[1986,63.23],[1987,63.65],[1988,64],[1989,64.22],[1990,64.24],[1991,63.97],[1992,63.38],[1993,62.47],[1994,61.26],[1995,59.76],[1996,57.98],[1997,56.05],[1998,54.08],[1999,52.21],[2000,50.65],[2001,49.59],[2002,49.11],[2003,49.22],[2004,49.87],[2005,50.92],[2006,52.17],[2007,53.39],[2008,54.4],[2009,55.12]]],
        ["name":"Burkina Faso","region":"Sub-Saharan Africa","income":[[1800,454.33],[1820,454.33],[1913,497.44],[1950,515.71],[1951,529.66],[1952,543.26],[1953,557.01],[1954,571.4],[1955,586.4],[1956,601.99],[1957,617.18],[1958,633.89],[1959,649.7],[1960,661.86],[1961,684.8],[1962,722.51],[1963,708.58],[1964,719.57],[1965,740.98],[1966,737.83],[1967,794.83],[1968,810.76],[1969,817.43],[1970,809.75],[1971,831.9],[1972,854.74],[1973,798.63],[1974,772.28],[1975,727.95],[1976,709.39],[1977,743.39],[1978,811.57],[1979,800.89],[1980,794.76],[1981,809.75],[1982,807.2],[1983,778.05],[1984,770.53],[1985,848.8],[1986,955.4],[1987,912.06],[1988,957.87],[1989,917.41],[1990,880.17],[1991,938.09],[1992,931.75],[1993,895.91],[1994,878.97],[1995,889.91],[1996,929.21],[1997,946.29],[1998,978.6],[1999,1009.59],[2000,1001.48],[2001,1029.97],[2002,1037.65],[2003,1080.53],[2004,1096.85],[2005,1140],[2006,1175.51],[2007,1189.88],[2008,1223.52],[2009,1234.42]],"population":[[1800,1665421],[1820,1665421],[1950,4376162],[1951,4422822],[1952,4469979],[1953,4517639],[1954,4565808],[1955,4614490],[1956,4663691],[1957,4713416],[1958,4763672],[1959,4814463],[1960,4865796],[1961,4890688],[1962,4919632],[1963,4952695],[1964,4989961],[1965,5031519],[1966,5077473],[1967,5127935],[1968,5183033],[1969,5242904],[1970,5303777],[1971,5366018],[1972,5433886],[1973,5507594],[1974,5587373],[1975,5673472],[1976,5764606],[1977,5889574],[1978,6023204],[1979,6165533],[1980,6315312],[1981,6471556],[1982,6634596],[1983,6804810],[1984,6982590],[1985,7168228],[1986,7367641],[1987,7586551],[1988,7824563],[1989,8076170],[1990,8335771],[1991,8603238],[1992,8878303],[1993,9159653],[1994,9467871],[1995,9772602],[1996,10060724],[1997,10352843],[1998,10652495],[1999,10975109],[2000,11308552],[2001,11732326],[2002,12251209],[2003,12705775],[2004,13092647],[2005,13491736],[2006,13902972],[2007,14326203],[2008,14761339]],"lifeExpectancy":[[1800,29.2],[1945,29.2],[1950,32.89],[1951,33.09],[1952,33.49],[1953,33.9],[1954,34.34],[1955,34.79],[1956,35.26],[1957,35.74],[1958,36.24],[1959,36.74],[1960,37.25],[1961,37.76],[1962,38.25],[1963,38.73],[1964,39.2],[1965,39.63],[1966,40.04],[1967,40.43],[1968,40.79],[1969,41.14],[1970,41.48],[1971,41.82],[1972,42.17],[1973,42.53],[1974,42.9],[1975,43.27],[1976,43.64],[1977,44],[1978,44.33],[1979,44.65],[1980,44.95],[1981,45.22],[1982,45.49],[1983,45.75],[1984,46.01],[1985,46.27],[1986,46.51],[1987,46.75],[1988,46.98],[1989,47.2],[1990,47.42],[1991,47.65],[1992,47.89],[1993,48.14],[1994,48.41],[1995,48.7],[1996,49.01],[1997,49.34],[1998,49.68],[1999,50.02],[2000,50.37],[2001,50.72],[2002,51.07],[2003,51.42],[2004,51.76],[2005,52.09],[2006,52.42],[2007,52.74],[2008,53.06],[2009,53.38]]]
      ]

      render data as JSON
    }

    def graph() {


      render(view: "graph", model: [])
    }

    def graphData() {
      def data = [
        "nodes":[
          ["name":"Home", "value": 2, "group":1, "img": "home"],
          ["name":"University", "value": 3, "group":2, "img": "university"],
          ["name":"Work", "value": 5,"group":3, "img": "work"],
          ["name":"Eat", "value": 7,"group":4, "img": "eat"]
        ],
        "links":[
          ["source":1,"target":0,"value":10],
          ["source":2,"target":0,"value":8],
          ["source":3,"target":0,"value":10],
          ["source":3,"target":2,"value":6]
        ]
      ]

      render data as JSON
    }

    def dailyLocation() {
      render(view: "dailyLocation", model: [])
    }

    def graphData2() {
      // Max size should be 100. Then a simple cross multiplication (rule of
      // three) should be enough.
      //
      // Dummy data: 885, 90, 390, 75.
      // Converted : 100, 10.17, 44.07, 8.47

      def weekday = params?.id ? Integer.parseInt(params?.id) : 1

      def csv = new File("/opt/test-data.csv")

      def home = 0
      def unusual_home = 0
      def family_home = 0
      def friend_home = 0
      def university = 0
      def workplace = 0
      def leisure = 0
      def commercial = 0
      def street_transport = 0
      def other = 0

      csv.splitEachLine(',') { row ->
        if(Integer.parseInt(row[0]) == weekday) {
          switch(Integer.parseInt(row[2])) {
            case 1: home++; break;
            case 2: unusual_home++; break;
            case 3: family_home++; break;
            case 4: friend_home++; break;
            case 5: university++; break;
            case 6: workplace++; break;
            case 7: leisure++; break;
            case 8: commercial++; break;
            case 9: street_transport++; break;
            default: other++;
          }
        }
      }

      double max = Double.NEGATIVE_INFINITY;

      for (double d : [home, unusual_home, family_home, friend_home, university, workplace, leisure, commercial, street_transport, other]) {
        if (d > max) max = d;
      }

      def n_home = ( home * 100) / max
      def n_unusual_home = (unusual_home * 100) / max
      def n_family_home = (family_home * 100) / max
      def n_friend_home = (friend_home * 100) / max
      def n_university = (university * 100) / max
      def n_workplace = (workplace * 100) / max
      def n_leisure = (leisure * 100) / max
      def n_commercial = (commercial * 100) / max
      def n_street_transport = (street_transport * 100) / max
      def n_other = (other * 100) / max


      def weekday_name = ""

      if(weekday == 1) weekday_name = "Monday"
      else if(weekday == 2) weekday_name = "Tuesday"
      else if(weekday == 3) weekday_name = "Wednesday"
      else if(weekday == 4) weekday_name = "Thursday"
      else if(weekday == 5) weekday_name = "Friday"
      else if(weekday == 6) weekday_name = "Saturday"
      else if(weekday == 7) weekday_name = "Sunday"

      def data = [
        "name": weekday_name,
        "img": weekday_name.toLowerCase(),
        "children": [

        ]
      ]

      if(home > 0) {
        data["children"] << [
          "name": "Home (" + home * 15 + ")",
          "desc": "Home",
          "link": "",
          "img": "1",
          "size": n_home
        ]
      }

      if(unusual_home > 0) {
        data["children"] << [
          "name": "Unusual Home (" + unusual_home * 15 + ")",
          "desc": "Home",
          "link": "",
          "img": "2",
          "size": n_unusual_home
        ]
      }

      if(family_home > 0) {
        data["children"] << [
          "name": "Family Home (" + family_home * 15 + ")",
          "desc": "Family Home",
          "link": "",
          "img": "3",
          "size": n_family_home
        ]
      }

      if(friend_home > 0) {
        data["children"] << [
          "name": "Friend Home (" + friend_home * 15 + ")",
          "desc": "Friend Home",
          "link": "",
          "img": "4",
          "size": n_friend_home
        ]
      }

      if(university > 0) {
        data["children"] << [
          "name": "University (" + university * 15 + ")",
          "desc": "University",
          "link": "",
          "img": "5",
          "size": n_university
        ]
      }

      if(workplace > 0) {
        data["children"] << [
          "name": "Workplace (" + workplace * 15 + ")",
          "desc": "Workplace",
          "link": "",
          "img": "6",
          "size": n_workplace
        ]
      }

      if(leisure > 0) {
        data["children"] << [
          "name": "Leisure (" + leisure * 15 + ")",
          "desc": "Leisure",
          "link": "",
          "img": "7",
          "size": n_leisure
        ]
      }

      if(commercial > 0) {
        data["children"] << [
          "name": "Commercial (" + commercial * 15 + ")",
          "desc": "Commercial",
          "link": "",
          "img": "8",
          "size": n_commercial
        ]
      }

      if(street_transport > 0) {
        data["children"] << [
          "name": "Street / Transport (" + street_transport * 15 + ")",
          "desc": "Street / Transport",
          "link": "",
          "img": "9",
          "size": n_street_transport
        ]
      }

      if(other > 0) {
        data["children"] << [
          "name": "Other (" + other * 15 + ")",
          "desc": "Other",
          "link": "",
          "img": "10",
          "size": n_other
        ]
      }

      /*
      [
        "name": "Home (" + home + ")",
        "desc": "Home",
        "link": "",
        "img": "1",
        "size": n_home
      ],
      [
        "name": "Unusual Home (" + unusual_home + ")",
        "desc": "Home",
        "link": "",
        "img": "2",
        "size": n_unusual_home
      ],
      [
        "name": "Family Home (" + family_home + ")",
        "desc": "Family Home",
        "link": "",
        "img": "3",
        "size": n_family_home
      ],
      [
        "name": "Friend Home (" + friend_home + ")",
        "desc": "Friend Home",
        "link": "",
        "img": "4",
        "size": n_friend_home
      ],
      [
        "name": "University (" + university + ")",
        "desc": "University",
        "link": "",
        "img": "5",
        "size": n_university
      ],
      [
        "name": "Workplace (" + workplace + ")",
        "desc": "Workplace",
        "link": "",
        "img": "6",
        "size": n_workplace
      ],
      [
        "name": "Leisure (" + leisure + ")",
        "desc": "Leisure",
        "link": "",
        "img": "7",
        "size": n_leisure
      ],
      [
        "name": "Commercial (" + commercial + ")",
        "desc": "Commercial",
        "link": "",
        "img": "8",
        "size": n_commercial
      ],
      [
        "name": "Street / Transport (" + street_transport + ")",
        "desc": "Street / Transport",
        "link": "",
        "img": "9",
        "size": n_street_transport
      ],
      [
        "name": "Other (" + other + ")",
        "desc": "Other",
        "link": "",
        "img": "10",
        "size": n_other
      ]
      */

      render data as JSON
    }

    def timeSeries() {
        def id = params?.id

        def csvFile = "test-data.csv"

        if(id == "2") csvFile = "cara.csv"
        else if(id == "3") csvFile = "sara.csv"
        else if(id == "4") csvFile = "ilargia.csv"

        //def csv = new File("/opt/test-data.csv")
        def csv = new File("/opt/" + csvFile)

        def currentDay = 1
        def currentLoc = -1

        def aData = []
        for(def i = 1; i <= 10; i++) {
            aData.add(['label': i, 'data': []])
        }
        //println aData
        //println aData[2]

        def interval = [:]

        csv.splitEachLine(',') { row ->
            currentDay = row[0]

            def time = row[1]
            if(time.size() == 1) time = "0" + time + ":00"
            else if(time.size() == 2) time = time + ":00"
            else if(time.size() == 3 && time.indexOf(':') == 1) time = "0" + time + "0"
            else if(time.size() == 4 && time.indexOf(':') == 1) time = "0" + time
            else if(time.size() == 4 && time.indexOf(':') == 2) time = time + "0"

            if(currentLoc == -1) {
                currentLoc = row[2]

                interval['type'] = "TimelineChart.TYPE.INTERVAL"
                def rowDate = "2016/02/0" + currentDay + " " + time
                interval['from'] = new Date().parse('yyyy/MM/dd HH:mm', rowDate)
            }

            if(row[2] != currentLoc && row[2] != null) {
                //println "Location changed from " + currentLoc + " to " + row[2]
                def rowDate = "2016/02/0" + currentDay + " " + time
                interval['to'] = new Date().parse('yyyy/MM/dd HH:mm', rowDate)

                for(def i = 0; i < aData.size(); i++) {
                    if(aData[i]['label'].equals(Integer.parseInt(currentLoc))) aData[i]['data'].add(interval.clone())
                }

                interval = [:]
                interval['type'] = "TimelineChart.TYPE.INTERVAL"
                interval['from'] = new Date().parse('yyyy/MM/dd HH:mm', rowDate)

                currentLoc = row[2]
            }
        }

        def rowDate = "2016/02/07 24:00"
        interval['to'] = new Date().parse('yyyy/MM/dd HH:mm', rowDate)

        for(def i = 0; i < aData.size(); i++) {
            if(aData[i]['label'] == Integer.parseInt(currentLoc)) aData[i]['data'].add(interval.clone())
        }

        def totalPlaces = 0
        for(def i = 0; i < aData.size(); i++) {
            if(aData[i]['data'].size() > 0) totalPlaces++
        }
        //println aData

        /*
        def allData = []
        def dayIntervals = []
        def currentInterval = [:]
        interval['type'] = "TimelineChart.TYPE.INTERVAL"
        def first = true
        csv.splitEachLine(',') { row ->
            if(currentLoc == -1) currentLoc = row[2]
            if(Integer.parseInt(row[0]) != currentDay) {

            }
            else {
                // If user changed location ...
                if(currentLoc != row[2]) {
                    // First we close the previous interval
                    def rowDate = "2016/02/0" + currentDay + " " + row[1]
                    interval['to'] = new Date().parse('yyyy/MM/dd HH:mm', rowDate)

                    dayIntervals.append(interval)
                    def dayData = [:]
                    dayData['label'] = currentDay
                    dayData[]


                    currentInterval = [:]
                    interval['type'] = "TimelineChart.TYPE.INTERVAL"
                    interval['from'] = new Date().parse('yyyy/MM/dd HH:mm', rowDate)
                }
                // We are in the same location
                else {
                    // If this is the first data point at this location ...
                    if(first) {
                        def rowDate = "2016/02/0" + currentDay + " " + row[1]
                        interval['from'] = new Date().parse('yyyy/MM/dd HH:mm', rowDate)
                        first = false
                    }
                }

                interval['from'] =
            }
        }
        */



      def odata = [
        'label': 'Home',
        'data': [[
          'type': 'TimelineChart.TYPE.POINT',
          'at': 'new Date(2012, 12, 2, 1, 36, 45, 0)'
        ], [
          'type': 'TimelineChart.TYPE.POINT',
          'at': 'new Date(2012, 12, 9, 1, 36, 45, 0)'
        ], [
          'type': 'TimelineChart.TYPE.POINT',
          'at': 'new Date(2012, 12, 9, 1, 36, 45, 0)'
        ]]
      ]

      def count = totalPlaces.intdiv(2) + "00px"
      render(view: "timeSeries", model: ['data': aData as JSON, 'count': count])
    }

    def locationEvolution() {
      def data = []

      def id = params?.id

      def csvFile = "test-data.csv"

      if(id == "2") csvFile = "cara.csv"
      else if(id == "3") csvFile = "sara.csv"
      else if(id == "4") csvFile = "ilargia.csv"

      //def csv = new File("/opt/test-data.csv")
      def csv = new File("/opt/" + csvFile)

      def home = 0
      def unusual_home = 0
      def family_home = 0
      def friend_home = 0
      def university = 0
      def workplace = 0
      def leisure = 0
      def commercial = 0
      def street_transport = 0
      def other = 0

      def currentDay = 1
      def t = 0
      def date = new Date()

      csv.splitEachLine(',') { row ->
        if(Integer.parseInt(row[0]) != currentDay) {
          t = 0


          currentDay = Integer.parseInt(row[0])
          home = 0
          unusual_home = 0
          family_home = 0
          friend_home = 0
          university = 0
          workplace = 0
          leisure = 0
          commercial = 0
          street_transport = 0
          other = 0
        }

        data.add([x: 22 + currentDay, y: 0, z: home, t: t])
        data.add([x: 22 + currentDay, y: 1, z: unusual_home, t: t])
        data.add([x: 22 + currentDay, y: 2, z: family_home, t: t])
        data.add([x: 22 + currentDay, y: 3, z: friend_home, t: t])
        data.add([x: 22 + currentDay, y: 4, z: university, t: t])
        data.add([x: 22 + currentDay, y: 5, z: workplace, t: t])
        data.add([x: 22 + currentDay, y: 6, z: leisure, t: t])
        data.add([x: 22 + currentDay, y: 7, z: commercial, t: t])
        data.add([x: 22 + currentDay, y: 8, z: street_transport, t: t])
        data.add([x: 22 + currentDay, y: 9, z: other, t: t])

        def locationValue
        if(row[2] == null || row[2] == '') {
            if(row[3] == null || row[3] == '') locationValue = "99"
            else locationValue = row[3]
        }
        else locationValue = row[2]

        switch(Integer.parseInt(locationValue)) {
          case 1: home++; break;
          case 2: unusual_home++; break;
          case 3: family_home++; break;
          case 4: friend_home++; break;
          case 5: university++; break;
          case 6: workplace++; break;
          case 7: leisure++; break;
          case 8: commercial++; break;
          case 9: street_transport++; break;
          default: other++;
        }
        t++
      }

      render(view: "locationEvolution", model: ['data': data as JSON])
    }
}
