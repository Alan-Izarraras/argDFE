set1_input <- "../../Data/trees/MatrixInputs/new_likelihood_experiment/second_run/set1/matrices/"
#set1_input <- "../../Data/trees/MatrixInputs/new_likelihood_experiment/set1/source_trees/reps/"
set2_input <- "../../Data/trees/MatrixInputs/new_likelihood_experiment/second_run/set2/"

task_id <- Sys.getenv("SLURM_ARRAY_TASK_ID")
task_id <- as.numeric(task_id) #taskid controls matrix dimension

matrix_selection <- c("200x100", "20x100", "6x100", "200x40", "20x40", "6x40", "200x8", "20x8", "6x8")
prob_matrix_name <- paste(set2_input, "set2_", matrix_selection[task_id], "_prob_matrix_Sel", sep="")
count_matrix_name <- paste(set1_input, "observed_", matrix_selection[task_id], "_count_matrix_Sel", sep="")

missing_vector <- vector()
i <- 0

for (z in 1:50)  { #z handles repetition number
  for (b in (1:27))  {
    count_matrix <- paste(count_matrix_name, b, "_rep", z, ".csv", sep="")
    # Check if a file exists
    if (file.exists(count_matrix)) {
    variable <- 1
    } else {
    print("File does not exist.")
    missing_vector[i] <- count_matrix
    i <- i +1
    }
  }
}

print("these are the missing matrices")
print(missing_vector)

