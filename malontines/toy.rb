class Widget
  attr_accessor :height, :width, :depth

  def initialize(widget_info = {})
    # self.height = widget_info[:height]
    # self.width = widget_info[:width]
    # self.depth = widget_info[:depth]

    widget_info.keys.each do |k|
      method_name = (k.to_s + "=").to_sym
      self.send(method_name, widget_info.send(:[], k))
    end

  end

  def unallowed=(yolo)
    # ignore yolo for now and do what u want
  end
  # def height=(new_height)
  #   @height = new_height
  # end
end

Widget.new({height: 15, unallowed: true})
