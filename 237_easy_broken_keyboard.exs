

## split string at each newline or recursively split and categorize?

## break down each dictionary word into its consituent unique letters and alphabetize them,
## make that string an :atom, which will be key for the current longest word of that consituent unique letter set
## store :atoms in dictionary or map (find out what diff is?)
## break down input words same way and look em up by their unique :atom
defmodule BrokenKeyboard do

  def build_longest_word_by_unique_letters_map(words_string_in_list, previous_map) when (words_string_in_list == []) do
    IO.inspect previous_map
  end

  def build_longest_word_by_unique_letters_map(words_string_in_list, previous_map \\ Map.new) do
    [current_word | remaining_dictionary] = words_string_in_list
      |> hd()
      |> String.split("\r\n", parts: 2)
    current_key = atomize_sorted_uniques(current_word)
    current_map = add_to_map_or_discard(current_key, current_word, previous_map)
    build_longest_word_by_unique_letters_map(remaining_dictionary, current_map)
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
    cond do
      Map.keys(master_map) == 0 ->
        master_map
        |> Map.put(atom_key, candidate)
      !(master_map[atom_key]) ->
        master_map
        |> Map.put(atom_key, candidate)
      (String.length(master_map[atom_key]) > String.length(candidate)) ->
        master_map
        |> Map.put(atom_key, candidate)
      true ->
        master_map
    end
  end

end

case File.read("237_easy_dictionary_sample.txt") do
  {:ok, body} -> BrokenKeyboard.build_longest_word_by_unique_letters_map([body])

  {:error, reason} -> IO.puts reason
end

# "\r\nzymurgy\r\nzyzzyva\r\nzyzzyvas"
#                   |> String.slice(1..-1)
#                   |> String.split("\r\n", parts: 2)
#                   |> hd()
#                   |> IO.inspect