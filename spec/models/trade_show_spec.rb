require 'spec_helper'

describe TradeShow do

  context ".instance_methods" do
    before(:each) do
      @trade_show  = Factory(:trade_show)
    end

    context ".set_keywords=(value)" do
      it 'should set keywords' do
        @trade_show.set_keywords          =  'hi, my, name, is, Dave'
        @trade_show.keywords.should       == ['hi', 'my', 'name', 'is', 'Dave']
        @trade_show.set_keywords.should   == 'hi, my, name, is, Dave'
      end
    end

  end
end
