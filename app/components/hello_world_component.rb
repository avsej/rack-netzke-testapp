class HelloWorldComponent < Netzke::Basepack::FormPanel
  def items
    [
      :text_field,
      {:name => :number_field, :attr_type => :integer},
      {:name => :boolean_field, :attr_type => :boolean, :input_value => true},
      {:name => :date_field, :attr_type => :date},
      {:name => :combobox_field, :xtype => :combo, :store => [[1, "One"], [2, "Two"], [3, "Three"]]},
      {:name => :time_field, :attr_type => :time },
    ]
  end

  endpoint :netzke_submit do |params, this|
    data = ActiveSupport::JSON.decode(params["data"])
    this.netzke_feedback data.each_pair.map{ |k,v| "#{k.humanize}: #{v}" }.join("<br/>")
  end
end
