$ ->
  fund_id = $('#data-fund').data('fund')
  options = {
      width: 1000,
      height: 600
  }
  helper = (name) ->
    if name is "found"
      ".#{name}"
    else
      ".month_#{name.slice(5)}"
  console.log(fund_id, "fund_id")
  make_graph = (period) ->
    elem = helper(period)
    $.ajax({
      type: "GET",
      url: "/#{period}/#{fund_id}",
      data: {},
      success:(data) ->
        console.log data
        if data.no_graph
          $(elem).before('<div class="col-md-8 no-info-graph"><h2>Информация за выбранный период недоступна</h2></div')
        else
          labels = data.labels
          series = [data.series]
          d = {
              labels: labels,
              series: series
            }
          new Chartist.Line(elem, d, options)
        error:(data) ->
          console.log('ERROR', data)
    })

  if fund_id
    make_graph("found")
    make_graph("month1")
    make_graph("month3")
    make_graph("month6")
    make_graph("month12")
