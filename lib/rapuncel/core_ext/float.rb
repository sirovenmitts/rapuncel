class Float
  class << self
    attr_accessor :xmlrpc_double_as_bigdecimal
  
    def from_xml_rpc xml_node
      if xmlrpc_double_as_bigdecimal
        BigDecimal.from_xml_rpc xml_node
      else
        xml_node.text.strip.to_f
      end
    end
  end

  def to_xml_rpc b = Rapuncel.get_builder
    b.double to_s

    b.to_xml
  end
end
