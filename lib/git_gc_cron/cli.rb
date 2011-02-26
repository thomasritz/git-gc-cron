module GitGcCron
  class CLI

    def self.start
      verbose = ARGV.first == '-v' and ARGV.shift
      ARGV.each do |base|
        repos = Dir["#{base}/**/{.git,*.git}"]
        repos.each_with_index do |repo_path, i|
          Dir.chdir(repo_path) do
            puts repo_path if verbose
            system ["git", "(##{i + 1}/#{repos.size + 1} #{repo_path}) git"], "gc", "-q"
          end
        end
      end
    end

  end
end
