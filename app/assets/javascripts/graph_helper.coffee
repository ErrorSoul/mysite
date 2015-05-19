$ ->
  fund_id = $('#data-fund').data('fund')
  options = {
      width: "1132px",
      height: "500px"
  }

  helper = (name) ->
    if name is "found"
      ".#{name}"
    else
      ".month_#{name.slice(5)}"

  console.log(fund_id, "fund_id")

  make_graph = (period, type) ->
    elem = helper(period) + type
    $.ajax({
      type: "GET",

      #
      # /pie/month1/1 or
      # /pure/month12/1
      #

      url: "/#{type}/#{period}/#{fund_id}",
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
    t = "pie"
    make_graph("found",   t)
    make_graph("month1",  t)
    make_graph("month3",  t)
    make_graph("month6",  t)
    make_graph("month12", t)
    t = "pure"
    make_graph("found",   t)
    make_graph("month1",  t)
    make_graph("month3",  t)
    make_graph("month6",  t)
    make_graph("month12", t)
