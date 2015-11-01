use_synth :pulse

live_loop :kik do
  # sample :bd_haus, amp: 2
  # sleep 0.125
  # sample :bd_haus, amp: 2
  # sleep 0.125
  sample :bd_haus, amp: 2
  sleep 0.5
end

live_loop :snr do
  sync :kik
  sample :elec_ping, amp: 2
  sample :drum_snare_soft, amp: 2
  sleep 0.25
end

live_loop :melody do
  sync :kik
  with_fx :compressor  do
    2.times do
      play :C
      sleep 0.5
      play :D
      sleep 0.5
      play :E
      sleep 0.5
      play :C
      sleep 0.5
    end

    2.times do
      play :E
      sleep 0.5
      play :F
      sleep 0.5
      play :G
      sleep 1
    end

    2.times do
      play :G
      sleep 0.25
      play :A
      sleep 0.25
      play :G
      sleep 0.25
      play :F
      sleep 0.25
      play :E
      sleep 0.5
      play :C
      sleep 0.5
    end

    2.times do
      play :C
      sleep 0.5
      play 55
      sleep 0.5
      play :C
      sleep 1
    end
  end
end
