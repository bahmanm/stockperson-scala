# Copyright 2025 Bahman Movaqar
#
# This file is part of StockPerson-Scala.
#
# StockPerson-Scala is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# StockPerson-Scala is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License
# along with StockPerson-Scala. If not, see <https://www.gnu.org/licenses/>.
####################################################################################################

SHELL := /usr/bin/env bash
.DEFAULT_GOAL := test

####################################################################################################

export ROOT := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
export root.docs = $(ROOT)docs/

####################################################################################################

.PHONY : bmakelib/bmakelib.mk
include  bmakelib/bmakelib.mk

####################################################################################################

sbt.sbt ?= sbt
sbt.options ?= 
sbt.command = $(sbt.sbt) $(sbt.options)

####################################################################################################

.PHONY : sbt-options(%)

sbt.options(%) :
	$(eval sbt.options += $(*))

####################################################################################################

.PHONY : sbt(%)

sbt(%) :
	$(sbt.command) $(*)

####################################################################################################

.PHONY : test

test : sbt( test )

####################################################################################################

.PHONY : test-with-coverage

test-with-coverage :
	@sbt coverage test coverageReport

####################################################################################################

.PHONY : compile

compile : sbt( compile )

####################################################################################################

.PHONY : format

format : sbt( scalafmt )

####################################################################################################

.PHONY : clean

clean : sbt( clean )


