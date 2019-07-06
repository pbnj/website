---
author: "Peter Benjamin"
title: "Unit Testing Kubernetes Manifests"
date: 2019-05-21T08:29:03-07:00
tags: ["kubernetes", "security", "configuration", "unit testing"]
categories: ["kubernetes", "security", "development"]
draft: true
---

## Table of Content

<!-- toc -->
- [Introduction](#introduction)
- [What is conftest?](#what-is-conftest)
- [Demo](#demo)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Test](#test)
<!-- /toc -->

## Introduction

Among all the benefits that Kubernetes has brought us, the biggest has been the
declarative paradigm shift to building platforms. Everything is
configuration-driven and there is no sign of stopping either, given the [Cluster
API](https://github.com/kubernetes-sigs/cluster-api) project will be bringing
declarative, Kubernetes-style life-cycle management to your clusters themselves.

With the proliferation of infrastructure-as-code and configuration files, it is
increasingly critical for infrastructure teams and back-end engineers to ensure
that we don't introduce errors, bugs, or security misconfigurations to our
environments. Software Engineers ensure their software is as bug-free as
possible by writing unit tests. Well, it should come to no surprise to readers
that infrastructures need unit testing as well.

Infrastructure engineers have a few options at their disposal that may help in
this area. In this article, I will explore one tool in particular:
[`conftest`](https://github.com/instrumenta/conftest). So, without further
ado...

## What is conftest?

conftest is developed and maintained by the fine folks of
[Instrumenta](https://instrumenta.dev). Its stated purpose is to be a utility
for writing tests against structured configuration data using a declarative
language, called
[Rego](https://www.openpolicyagent.org/docs/how-do-i-write-policies.html).

Enough talk. Let's actually see what that looks like in practice!

## Demo

### Prerequisites

- `conftest` CLI: `brew tap instrumenta/instrumenta && brew install conftest` or
  download for the right platform from [GitHub
  Releases](https://github.com/instrumenta/conftest/releases)
- `opa` CLI (if you want nice features like `opa fmt`): `brew install opa` or download for the right platform
  from [GitHub Releases](https://github.com/open-policy-agent/opa/releases)

### Setup

### Test
