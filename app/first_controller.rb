
class FirstController < UIViewController

  def viewDidLoad
    @typewriter = TypewriterView.alloc.initWithFrame([[0, 0], [320, 400]])
    self.view.addSubview(@typewriter)

    blue_view  = UIView.alloc.initWithFrame([[0, 0],  [ 80, 80]])
    blue_view.backgroundColor = UIColor.blueColor
    red_view   = UIView.alloc.initWithFrame([[0, 0],  [120, 120]])
    red_view.backgroundColor = UIColor.redColor

    green_view = UIView.alloc.initWithFrame([[0, 0],  [120, 40]])
    green_view.backgroundColor = UIColor.greenColor
    cyan_view  = UIView.alloc.initWithFrame([[0, 0],  [120, 40]])
    cyan_view.backgroundColor = UIColor.cyanColor

    green_cyan_combo = TypewriterView.alloc.initWithFrame([[0, 0], [120, 120]])
    green_cyan_combo.addSubview(green_view)
    green_cyan_combo.addSubview(cyan_view)

    gray_view  = UIView.alloc.initWithFrame([[0, 0],  [80, 240]])
    gray_view.backgroundColor = UIColor.grayColor

    [blue_view, red_view, green_cyan_combo, gray_view].each { |view|
      @typewriter.addSubview(view)
    }
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    true
  end

  def willAnimateRotationToInterfaceOrientation(orientation, duration:duration)
    bframe = @typewriter.frame
    w, h = bframe.size.width, bframe.size.height
    bframe.size = h, w
    @typewriter.frame = bframe
    @typewriter.setNeedsLayout
  end

end
