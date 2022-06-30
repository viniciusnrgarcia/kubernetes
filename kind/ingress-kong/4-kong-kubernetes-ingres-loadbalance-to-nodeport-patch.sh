#!/bin/bash
kubectl patch service -n kong kong-proxy -p '{"spec":{"type":"NodePort"}}'