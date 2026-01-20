
Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

Error in file(file, "rt") : cannot open the connection
Calls: read.csv -> read.table -> file
In addition: Warning message:
In file(file, "rt") :
  cannot open file '../inference/ConstantSize/discrete_inference_200x8_SFS_diezmil.csv': No such file or directory
Execution halted

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union


Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

Error in `tibble::rownames_to_column()`:
! Column 27 must be named.
Caused by error in `repaired_names()`:
! Names can't be empty.
✖ Empty name found at location 27.
Backtrace:
     ▆
  1. ├─... %>% ...
  2. ├─dplyr::mutate(...)
  3. ├─tidyr::pivot_longer(...)
  4. └─tibble::rownames_to_column(., "rep")
  5.   └─tibble:::repaired_names(c(unique(names2(df)), var), repair_hint = FALSE)
  6.     ├─tibble:::subclass_name_repair_errors(...)
  7.     │ └─base::withCallingHandlers(...)
  8.     └─vctrs::vec_as_names(...)
  9.       └─vctrs (local) `<fn>`()
 10.         └─vctrs:::validate_unique(names = names, arg = arg, call = call)
 11.           └─vctrs:::stop_names_cannot_be_empty(names, call = call)
 12.             └─vctrs:::stop_names(...)
 13.               └─vctrs:::stop_vctrs(...)
 14.                 └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
Execution halted

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

Error in file(file, "rt") : cannot open the connection
Calls: read.csv -> read.table -> file
In addition: Warning message:
In file(file, "rt") :
  cannot open file '../inference/ConstantSize/discrete_inferences_type2_200x8_SFS_diezmil.csv': No such file or directory
Execution halted

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union


Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union


Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

Error in file(file, "rt") : cannot open the connection
Calls: read.csv -> read.table -> file
In addition: Warning message:
In file(file, "rt") :
  cannot open file '../inference/ConstantSize/discrete_inferences_200x8_mil_SFS.csv': No such file or directory
Execution halted
