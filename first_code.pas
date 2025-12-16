program Mbanking;
uses crt, SysUtils;
type
    account = record
        username : string;
        PIN : string;
        balance : integer;
        history_c : integer;
    end;

    history = record
        deskripsi : string;
        nominal : longint;
        waktu : string;
    end;
var
    acc : array[1..3] of account;
    his : array[1..100] of history;
    t_acc : integer = 0;


begin
end.
