case File.read("237_easy_dictionary.txt") do
  {:ok, body} ->  IO.puts(body)
  {:error, reason} -> IO.puts reason
end

## split string at each newline or recursively split and categorize?

## break down each dictionary word into its consituent unique letters and alphabetize them,
## make that string an :atom, which will be key for the current longest word of that consituent unique letter set
## store :atoms in dictionary or map (find out what diff is?)
## break down input words same way and look em up by their unique :atom