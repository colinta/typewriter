
class BoxFloatView < UIView

  def apps
    @apps ||= []
  end

  ##|
  ##|  STYLES
  ##|  easily stylable using teacup
  ##|   * backgroundColor is already supported by UIView
  ##|

  ##|
  ##|  DRAWING
  ##|
  def drawRect(rect)
    super
  end

end

module BoxFloatDelegate
end
