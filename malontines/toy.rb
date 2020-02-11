class Widget
  attr_accessor :height

  def initialize(widget_info = {})
    self.height = widget_info[:height]
  end

  def ==(thing)
    thing.upcase == "SPONGEBOB"
  end

end

class String

  def ==(thing)
    "SPONGEBOB"
  end
end

widget = Widget.new({height: 15})

puts widget == "hello"

puts widget == "spongebob"
