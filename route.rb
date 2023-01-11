require_relative 'instance_counter'
class Route
  include InstanceCounter

  attr_reader :stations, :from, :to

  def initialize(from, to)
    @from = from
    @to = to
    validate!
    @stations = [@from, @to]
    register_instance
  end

  def valid?
    validate!
    true
  rescue
    false
  end
  # Может добавлять промежуточную станцию в список
  def add_station(station)
    add_station!(station)
  end

  # Может удалять промежуточную станцию из списка
  def delete_station(station)
    delete_station!(station)
  end

  # Может выводить список всех станций по-порядку от начальной до конечной
  def show_stations
    puts "В маршрут #{stations.first.name} - #{stations.last.name} входят станции: "
    stations.each_with_index { |station, index| puts "#{index + 1} -> #{station.name}" }
  end

  private

  # Валидация маршрута
  def validate!
    raise 'Первая и последняя станция не должны совпадать' if from.name == to.name
    raise 'Не выбранно первая и последняя станция' if stations[0] == nil && stations[1] == nil
    raise 'Не выбранно первая или последняя станция' if stations[0] == nil || stations[1] == nil
  end
  # Может добавлять промежуточную станцию в список
  def add_station!(station)
    stations.insert(1, station)
  end

  # Может удалять промежуточную станцию из списка
  def delete_station!(station)
    stations.delete(station)
  end
end
