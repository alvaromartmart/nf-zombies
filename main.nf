process nf_sleep {
  input: 
    val x
  output:
    stdout
  script:
    """
    sleep $x
    """
}

workflow {
  Channel.fromList([10] + [300] * 5)
  | nf_sleep
  | first
  | subscribe { System.exit(0) }
}