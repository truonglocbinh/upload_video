class Post < ActiveRecord::Base
	has_attached_file :attachment, styles: {
	  medium: {geometry: "640x480", format:'mp4', convert_options: {
      input: {},
      output: {
        vcodec: 'libx264',
        movflags: '+faststart',
        strict: :experimental
      }
  	}
	},
		thumb: {geometry: "100x100#", format:'jpg', time: 10}
	}, processors: [:transcoder]
	validates_attachment_content_type :attachment, content_type: /\Avideo\/.*\Z/
	validates_attachment :attachment, size: {less_than: 130.megabytes}
	# process_in_background :attachment, only_process: [:medium]

	# def rotate!
 #  	attachment.reprocess_without_delay!
	# end
end
