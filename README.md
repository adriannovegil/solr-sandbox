# Apache Solr Sandbox

Get up and running a sandbox with Apache Solr and ZooKeeper using Docker and Docker Compose

## Fast Run

Clone this repo and execute the following command:

```
make up
```

or, if you prefer

```
docker-compose up
```

## Services

The following services will be started. Some of them are accessible via web:

| Component                                  | Description                                                 | Port      |
| ---------------------------------------    | --------------------------------------------------------    | -------------------------------    |
| `solr1`                                    | [Apache Solr node 1](https://solr.apache.org/)              | [`8981`](http://localhost:8981/) |
| `solr2`                                    | [Apache Solr node 2](https://solr.apache.org/)              | [`8982`](http://localhost:8982/) |
| `solr3`                                    | [Apache Solr node 3](https://solr.apache.org/)              | [`8983`](http://localhost:8983/) |
| `zoo1`                                     | [ZooKeeper node 1](https://zookeeper.apache.org/)           | [`2181`](http://localhost:2181/) |
| `zoo2`                                     | [ZooKeeper node 2](https://zookeeper.apache.org/)           | [`2182`](http://localhost:2182/) |
| `zoo3`                                     | [ZooKeeper node 3](https://zookeeper.apache.org/)           | [`2183`](http://localhost:2183/) |
| `solr-exporter`                            | [Solr Exporter](https://solr.apache.org/guide/7_3/monitoring-solr-with-prometheus-and-grafana.html)                  | [`9854`](http://localhost:9854/) |

## Observability

You can use this repo in combination with the [Observability Sandbox Lite](https://github.com/adriannovegil/observability-sandbox-lite)

The Apache Solr is launched with Prometheus exported activated. To get the metrics just add this code to the Prometheus targets configuration:

```
  # Apache Solr Sandbox
  - job_name: 'zoo-keeper-server'
    metrics_path: '/metrics'
    scrape_interval: 15s
    scrape_timeout: 15s
    static_configs:
      - targets: ['zoo1:7000', 'zoo2:7000', 'zoo3:7000']

  - job_name: 'solr-server'
    scrape_interval: 15s
    scrape_timeout: 15s
    static_configs:
      - targets: [solr-exporter:9854]
```

## Contributing

For a complete guide to contributing to the project, see the [Contribution Guide](CONTRIBUTING.md).

We welcome contributions of any kind including documentation, organization, tutorials, blog posts, bug reports, issues, feature requests, feature implementations, pull requests, answering questions on the forum, helping to manage issues, etc.

The project community and maintainers are very active and helpful, and the project benefits greatly from this activity.

### Reporting Issues

If you believe you have found a defect in the project or its documentation, use the repository issue tracker to report the problem to the project maintainers.

If you're not sure if it's a bug or not, start by asking in the discussion forum. When reporting the issue, please provide the version.

### Submitting Patches

The project welcomes all contributors and contributions regardless of skill or experience level.

If you are interested in helping with the project, we will help you with your contribution.

We want to create the best possible tool for our development teams and the best contribution experience for our developers, we have a set of guidelines which ensure that all contributions are acceptable.

The guidelines are not intended as a filter or barrier to participation. If you are unfamiliar with the contribution process, the team will help you and teach you how to bring your contribution in accordance with the guidelines.

For a complete guide to contributing, see the [Contribution Guide](CONTRIBUTING.md).

## Code of Conduct

See the [code-of-conduct.md](./code-of-conduct.md) file

## License

See the [LICENSE](./LICENSE) file
