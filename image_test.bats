#!/usr/bin/env bats

@test "Existence of docker" {
    run docker --version
    [ "$status" -eq 0 ]
    echo $output >&3
}

@test "Existence of nvcc" {
    run nvcc --version 
    [ "$status" -eq 0 ]
    echo $output >&3
}

@test "Docker with NVIDIA support" {
    skip
    run docker run -ti --gpus all --net=host --ipc=host nvidia/cuda:11.0-base nvidia-smi
    [ "$status" -eq 0 ]
    echo $output >&3
}

@test "Check DNS domain name" {
    run dnsdomainname
    [ "$status" -eq 0 ]
    [ "$output" = "cluster.na.tgsn.org" ]
    echo $output >&3
}