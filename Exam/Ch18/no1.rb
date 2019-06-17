# frozen_string_literal: true

def print_libraries
  libralies = $: # rubocop:disable Style/SpecialGlobalVars
  libralies.each { |path| puts path }
end

print_libraries if $PROGRAM_NAME == __FILE__
