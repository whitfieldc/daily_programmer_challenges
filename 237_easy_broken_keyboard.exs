

## split string at each newline or recursively split and categorize?

## break down each dictionary word into its consituent unique letters and alphabetize them,
## make that string an :atom, which will be key for the current longest word of that consituent unique letter set
## store :atoms in dictionary or map (find out what diff is?)
## break down input words same way and look em up by their unique :atom
defmodule BrokenKeyboard do

  def build_longest_word_by_unique_letters_map(dictionary_string) do
    word_and_dict = dictionary_string
      |> String.slice(1..-1)
      |> String.split("\r\n", parts: 2)
      |> Enum.to_list
      |> hd()
    # current_word = hd(word_and_dict)
    current_key = atomize_sorted_uniques(word_and_dict)
    current_map = add_to_map_or_discard(current_key, word_and_dict, %{})
    IO.puts(current_map)
  end

  def atomize_sorted_uniques(word) do
    word
    |> String.split("")
    |> Enum.uniq
    |> Enum.sort
    |> Enum.join
    |> String.to_atom
  end

  def add_to_map_or_discard(atom_key, candidate, master_map) do
    unless String.length(master_map[atom_key]) > String.length(candidate) do
      new_master_map = master_map
      |> Map.put(atom_key, candidate)
    end
    new_master_map || master_map
  end

end

case File.read("237_easy_dictionary.txt") do
  {:ok, body} -> BrokenKeyboard.build_longest_word_by_unique_letters_map(body)

  {:error, reason} -> IO.puts reason
end

# "\r\nzymurgy\r\nzyzzyva\r\nzyzzyvas"
#                   |> String.slice(1..-1)
#                   |> String.split("\r\n", parts: 2)
#                   |> hd()
#                   |> IO.inspect