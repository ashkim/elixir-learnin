defmodule MacroLoggerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  require MacroLogger
  doctest MacroLogger

  test "macro logger test" do
    # capture the output to assert the logging behavior
    log_output =
      capture_io(fn ->
        MacroLogger.log "Test message" do
          IO.puts("Executing block")
        end
      end)

    # assert the message was printed
    assert log_output =~ "INFO: Test message"

    # assert the block was executed
    assert log_output =~ "Executing block"
  end
end
