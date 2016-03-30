require File.dirname(__FILE__) + '/spec_helper'

describe "Metrics" do

  before(:each) do
    @metrics = Metrics.new
    @metrics.open("spec/small_test_output.smcsv")
  end

  it "should contain the same number of rows as in the csv file" do
    @metrics.rows.should == 5
  end

  it "should be possible to get the column index for a heading" do
    @metrics.col_index("Checkpoint Name").should == 1
  end
  
  it "should be possible to access the data in tabular format" do
    @metrics.cell_at(0, "Checkpoint Name").should == "b127"
  end
  
  it "should be sortable by complexity" do
    @metrics.sort_by_complexity!
    @metrics.cell_at(0, "File Name").should == "highest_complexity.cpp"
    @metrics.cell_at(@metrics.rows-1, "File Name").should == "lowest_complexity.cpp"
  end

end