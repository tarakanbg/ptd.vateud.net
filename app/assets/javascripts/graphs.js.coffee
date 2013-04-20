jQuery ->
  Morris.Line
    element: 'pilots_chart'
    data: $('#pilots_chart').data('pilots')
    xkey: 'created_at'
    ykeys: ['pilots', 'examinations', 'trainings']
    xLabels: 'day'
    labels: ['Pilots', 'Examinations', 'Trainings']
    # preUnits: '$'

  Morris.Line
    element: 'pilots_yearly_chart'
    data: $('#pilots_yearly_chart').data('pilots')
    xkey: 'created_at'
    ykeys: ['pilots', 'examinations', 'trainings']
    xLabels: 'day'
    labels: ['Pilots', 'Examinations', 'Trainings']
    # preUnits: '$'  