
{
  type token = EOF | Word of string
}

rule token = parse
  | eof { EOF }
  | ['a'-'z' 'A'-'Z']+ as word { Word(word) }
  | _ { token lexbuf }

{

module StringMap = Map.Make(String);;

 let lexbuf = Lexing.from_channel stdin in
 let wordlist = 
   let rec next l =
     match token lexbuf with
	 EOF -> l
     | Word(s) -> next (s :: l)
   in next []
 in

 (* Replace the code below this comment with code that scans through
    the list and builds a string map whose keys are words and whose
    values count the number of apearances of each word.  Then, use
    StringMap.fold to convert this to a list of (count, word) tuples. *)
 
    let wordMap =
      let f acc x = 
        if (StringMap.mem x acc) = true then StringMap.add x ((StringMap.find x acc)+1) acc
        else StringMap.add x 1 acc; 
      in List.fold_left f StringMap.empty wordlist
    in let wordcounts = StringMap.fold  (fun k v acc -> (v, k)::acc) wordMap []
        in let finalcounts = List.sort(fun (c1, _) (c2, _) -> compare c2 c1) wordcounts
        in List.iter (fun (x, y) -> print_int x; print_endline (" "^y)) finalcounts
  
(* Print the count, word pairs using List.iter
The output from running wordcount on the README file should begin
# ./wordcount < README
12 the
11 to
11 and
8 should
4 for
4 foo
4 be
4 baz
4 bar
4 assignment
4 a
3 zip
...

 *)

}
