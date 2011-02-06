module GitGcCron
  class CLI

    def self.start
      ARGV.each do |base|
        Dir["#{base}/**/{.git,*.git}"].each do |repo_path|
          Dir.chdir(repo_path) do
            system "git gc -q"
          end
        end
      end
    end

  end
end
