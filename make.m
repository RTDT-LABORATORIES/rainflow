clear rfc
clc
if 1
    % Check all permutations
    for hcm = 0:1
      for tp = 0:1
        for sd = 0:1
          for delegates = 0:1
            for int_counts = 0:1
              for val_type = {'float','double'}
                s = sprintf( ['mex ', ...
                              '-DRFC_VERSION_MAJOR="0" ', ...
                              '-DRFC_VERSION_MINOR="1" ', ...
                              '-DRFC_HCM_SUPPORT=%d ', ...
                              '-DRFC_TP_SUPPORT=%d ', ...
                              '-DRFC_SD_SUPPORT=%d ', ...
                              '-DRFC_USE_DELEGATES=%d ', ...
                              '-DRFC_USE_INTEGRAL_COUNTS=%d ', ...
                              '-DRFC_VALUE_TYPE=%s ', ...
                              '-output rfc ', ...
                              'rainflow.c'], ...
                              hcm, tp, sd, delegates, int_counts, val_type{1} );
                if system(s, '-echo') ~= 0
                  return
                end
              end
            end
          end
        end
      end
    end
else
    mex -g -v -output rfc rainflow.c
end
