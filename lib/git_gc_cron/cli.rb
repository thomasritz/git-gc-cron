module GitGcCron
  class CLI

    def self.start
      ARGV.each do |base|
        repos = Dir["#{base}/**/{.git,*.git}"]
        repos.each_with_index do |repo_path, i|
          Dir.chdir(repo_path) do
            system ["git", "(##{i + 1}/#{repos.size + 1} #{repo_path}) git"], "gc", "-q"
          end
        end
      end
    end

  end
end
