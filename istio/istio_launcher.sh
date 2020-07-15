tmux new -d -s istio 

tmux split-window -t istio:0 "istioctl dashboard grafana"
tmux split-window -t istio:0 "istioctl dashboard prometheus"
tmux split-window -t istio:0 "istioctl dashboard jaeger"
tmux split-window -t istio:0 "istioctl dashboard kiali"
tmux split-window -t istio:0 "istioctl dashboard envoy"

tmux select-layout -t istio:0 tiled

tmux attach -t istio
