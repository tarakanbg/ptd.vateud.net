jQuery ->
  Morris.Line
    element: 'pilots_chart'
    data: $('#pilots_chart').data('pilots')
    xkey: 'created_at'
    ykeys: ['pilots', 'examinations']
    xLabels: 'day'
    labels: ['Pilots', 'Examinations']
    # preUnits: '$'

  Morris.Line
    element: 'pilots_yearly_chart'
    data: $('#pilots_yearly_chart').data('pilots')
    xkey: 'created_at'
    ykeys: ['pilots', 'examinations']
    xLabels: 'day'
    labels: ['Pilots', 'Examinations']
    # preUnits: '$'  