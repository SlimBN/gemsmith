# frozen_string_literal: true

module Gemsmith
  module Skeletons
    # Configures default gem support.
    class GemSkeleton < BaseSkeleton
      def create
        cli.template "%gem_name%/bin/setup.tt", configuration.to_h
        cli.template "%gem_name%/Gemfile.tt", configuration.to_h
        cli.template "%gem_name%/%gem_name%.gemspec.tt", configuration.to_h
        cli.template "#{lib_root}/%gem_name%.rb.tt", configuration.to_h
        cli.template "#{lib_root}/%gem_name%/identity.rb.tt", configuration.to_h
        cli.chmod "#{configuration.gem_name}/bin/setup", 0755
      end
    end
  end
end
