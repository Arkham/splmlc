use_bpm 140

song = "4a1 4#a1 8g1 8#a1 8c2 8f1 8a1 4#a1 8g1 8#a1 8d2 4#d2 8d2 8c2 4#a1 8g1 8#a1 8c2 8f1 8a1 4#a1 8g1 8#a1 8d2 4#d2 8d2 8c2 4#a1 8g1 8#a1 8c2 8f1 8a1 4#a1 8g1 8#a1 8d2 4#d2 8d2 8c2 4#a1 8g1 8#a1 8a1 8f1 8f1 2g1"

class NokringParser
  DURATION_REGEX = %r{(?<duration>1|2|4|8|16|32)?(?<dotted>\.)?}
  NOTE_REGEX = %r{^#{DURATION_REGEX}(?<sharp>\#)?(?<note>[cdefgab])(?<octave>[1234])?$}
  PAUSE_REGEX = %r{^#{DURATION_REGEX}\-$}x

  attr_reader :default_duration, :default_octave

  def initialize(default_duration: 4, default_octave: 2)
    @default_duration = default_duration
    @default_octave = default_octave
  end

  def parse(expr)
    if match = expr.match(NOTE_REGEX)
      octave = match[:octave] || default_octave
      octave = octave.to_i + 2

      note = match[:note]
      note += 's' if match[:sharp]

      [:note, "#{note}#{octave}".to_sym, parse_duration(match)]
    elsif match = expr.match(PAUSE_REGEX)
      [:pause, parse_duration(match)]
    else
      [:error, expr]
    end
  end

  private

  def parse_duration(match)
    duration = match[:duration] || default_duration
    duration = 4.0 / duration.to_i
    duration *= 1.5 if match[:dotted]
    duration
  end
end

parser = NokringParser.new

live_loop :nokia do
  song.split(" ").map{|expr| parser.parse(expr)}.each do |result|
    case result.first
    when :note
      _, note, duration = result
      play note, release: duration * 1.1
      sleep duration 
    when :pause
      _, duration = result
      sleep duration
    else
      _, error = result
      puts "Error, couldn't parse expression: #{error}"
    end
  end
end
