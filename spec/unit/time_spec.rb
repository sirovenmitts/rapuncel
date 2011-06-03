require 'spec_helper'


describe Time do
  it 'serialization' do
    time = Time.now
    
    time.to_xml_rpc.should have_xpath('/dateTime.iso8601', :content => time.iso8601)
  end
  
  it 'deserialization' do
    time = Time.now
    xml = <<-XML
      <dateTime.iso8601>#{time.iso8601}</dateTime.iso8601>
    XML
    
    parsed_time = Object.from_xml_rpc xml
    parsed_time.should be_a Time
    parsed_time.to_i.should == time.to_i
  end
end