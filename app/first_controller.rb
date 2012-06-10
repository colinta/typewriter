
class FirstController < UIViewController

  def viewDidLoad
    @typewriter = TypewriterView.alloc.initWithFrame([[0, 0], [320, 480]])
    @typewriter.backgroundColor = UIColor.darkGrayColor
    @typewriter.margin = 8
    @typewriter.spacing = 4
    self.view.addSubview(@typewriter)

    96.times do
      height = (rand() * 50).to_i + 10  # between 10 and 60
      the_view = UIView.alloc.initWithFrame([[0, 0],  [40, 40]])
      red =   rand
      green = rand
      blue =  rand
      the_view.backgroundColor = UIColor.colorWithRed(red, green:green, blue:blue, alpha:1)
      @typewriter.addSubview(the_view)
    end
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
