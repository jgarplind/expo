//
// Created by Christian Falch on 24/08/2021.
//

#pragma once

#include <chrono>
#include <string>

#include <ABI48_0_0RNSkLog.h>

namespace ABI48_0_0RNSkia {

class ABI48_0_0RNSkMeasureTime {
public:
  explicit ABI48_0_0RNSkMeasureTime(const std::string &name)
      : _name(name), _start(std::chrono::high_resolution_clock::now()) {}

  ~ABI48_0_0RNSkMeasureTime() {
    auto stop = std::chrono::high_resolution_clock::now();
    auto duration =
        std::chrono::duration_cast<std::chrono::milliseconds>(stop - _start)
            .count();
    ABI48_0_0RNSkLogger::logToConsole("%s: %lld ms\n", _name.c_str(), duration);
  }

private:
  std::string _name;
  std::chrono::time_point<std::chrono::steady_clock> _start;
};

}; // namespace ABI48_0_0RNSkia
