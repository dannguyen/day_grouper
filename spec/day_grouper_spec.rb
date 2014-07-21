require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DayGrouper" do
  it "passes" do
    expect(1).to eq 1
  end


  let(:messages){
    [{created_at: "2009-09-01"}, {created_at: "2009-09-03"}]
  }

  it 'should group by date and fill in days' do
    agg = messages.group_by_day{|u| u[:created_at]}
    expect(agg.values).to eq([[{created_at: "2009-09-01"}], [], [{created_at: "2009-09-03"}]])
    expect(agg.keys[1].strftime("%Y-%m-%d")).to eq "2009-09-02"
  end

end
