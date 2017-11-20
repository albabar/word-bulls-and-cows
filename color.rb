# frozen_string_literal: true

module Color
  def format(str, color_code, size_code)
    "\e[#{color_code}m#{str}\e[#{size_code}m"
  end

  def colorize(str, color_code)
    format(str, color_code, 0)
  end

  def red(str)
    colorize(str, 31)
  end

  def green(str)
    colorize(str, 32)
  end

  def yellow(str)
    colorize(str, 33)
  end

  def blue(str)
    colorize(str, 34)
  end

  def cyan(str)
    colorize(str, 36)
  end

  def light_blue(str)
    colorize(str, 36)
  end

  def bold(str)
    format(str, 1, 22)
  end
end
