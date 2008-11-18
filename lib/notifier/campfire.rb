require 'rubygems'
require 'integrity'
require 'tinder'

module Integrity
  class Notifier
    class Campfire < Notifier::Base
      attr_reader :config

      def self.to_haml
        File.read File.dirname(__FILE__) / "config.haml"
      end

      def deliver!
        room.speak "#{short_message}. #{build_url}"
        room.paste full_message if build.failed?
      end

    private
      def room
        @room ||= begin
          campfire = Tinder::Campfire.new(config['account'])
          campfire.login(config['user'], config['pass'])
          campfire.find_room_by_name(config['room'])
        end
      end

      def short_message
        "Build #{build.short_commit_identifier} of #{build.project.name} #{build.successful? ? "was successful" : "failed"}"
      end

      def full_message
        <<-EOM
Commit Message: #{build.commit_message}
Commit Date: #{build.commited_at}
Commit Author: #{build.commit_author.name}

#{stripped_build_output}
EOM
      end
    end
  end
end
