require 'fastercsv'
require 'pp'

class Metrics
  attr_accessor :data, :headers, :as_json
   
  def open(filename)
    table = FasterCSV.read(filename, {:headers=>true})
    @as_json = FasterCSV.read(filename).to_json
    @data = table.to_a
    @data.shift
    @headers = table.headers
  end
  
  def rows
    @data.length
  end
  
  def cell_at(row, col)
    @data[row][col_index(col)]
  end

  def col_index(column_name)
    @headers.index column_name
  end
  
  def get_info_on_maximum_complexity
    p @data
    @data[0]
  end
  
  def sort_by_complexity!(ascending = false)
    idx = col_index("Maximum Complexity")
    @data.sort! {|rowa, rowb| rowb[idx].to_i <=> rowa[idx].to_i}
  end
  
end