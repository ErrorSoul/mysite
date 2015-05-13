$ ->
  fund_id = $('#data-fund').data('fund')
  options = {
      width: 1000,
      height: 600
  }
  console.log(fund_id, "fund_id")
  
  $.ajax({
    type: "GET",
    url: "/found/#{fund_id}",
    data: {},
    success:(data) ->
      console.log data
      if data.no_graph
        alert "NO GRAPH"
      else
        labels = data.labels
        series = [data.series]
        d = {
            labels: labels,
            series: series
          }
          
        new Chartist.Line('.found', d, options)
      error:(data) ->
        console.log('ERROR', data)
    })

  $.ajax({
    type: "GET",
    url: "/month1/#{fund_id}",
    data: {},
    success:(data) ->
      console.log data
      if data.no_graph
        alert "NO GRAPH"
      else
        labels = data.labels
        series = [data.series]
        d = {
            labels: labels,
            series: series
          }
          
        new Chartist.Line('.month_1', d, options)
      error:(data) ->
        console.log('ERROR', data)
    })

  $.ajax({
      type: "GET",
      url: "/month3/#{fund_id}",
      data: {},
      success:(data) ->
        console.log data
        if data.no_graph
          alert "NO GRAPH"
        else
          labels = data.labels
          console.log(labels, "labels")
          series = [data.series]
          console.log(labels, "labels")
          d = {
            labels: labels,
            series: series
          }
          console.log("D", d)
          new Chartist.Line('.month_3', d, options)
      error:(data) ->
        console.log('ERROR', data)
    })

  $.ajax({
    type: "GET",
    url: "/month6/#{fund_id}",
    data: {},
    success:(data) ->
      console.log data
      if data.no_graph
        alert "NO GRAPH"
      else
        labels = data.labels
        series = [data.series]
        d = {
            labels: labels,
            series: series
          }
          
        new Chartist.Line('.month_6', d, options)
      error:(data) ->
        console.log('ERROR', data)
    })

  $.ajax({
    type: "GET",
    url: "/month12/#{fund_id}",
    data: {},
    success:(data) ->
      console.log data
      if data.no_graph
        alert "NO GRAPH"
      else
        labels = data.labels
        series = [data.series]
        d = {
            labels: labels,
            series: series
          }
          
        new Chartist.Line('.month_12', d, options)
      error:(data) ->
        console.log('ERROR', data)
    })
  


    
    
  
