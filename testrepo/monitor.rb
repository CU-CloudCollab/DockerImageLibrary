#!/usr/bin/env ruby

disk_path = '--disk-path=/rootfs'
if ENV['PATHS']
  ENV['PATHS'].split(',').each do |path|
    disk_path += ' --disk-path=/rootfs' + path
  end
end

loop do
  puts `/aws-scripts-mon/mon-put-instance-data.pl --mem-util --swap-util #{disk_path} --disk-space-util`
  sleep(300)
end
