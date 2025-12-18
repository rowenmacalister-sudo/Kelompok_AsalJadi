unit utype;

interface
uses SysUtils;

type
    account = record
        username : string;
        PIN : string;
        balance : longint;
        history_c : integer;
    end;

    history = record
        deskripsi : string;
        nominal : longint;
        waktu : string;
    end;

procedure addhis(i:integer; des:string; nominal:longint);
procedure showhis(i:integer);

var
    acc : array[1..3] of account;
    his : array[1..100] of history;
    t_acc : integer;

implementation
uses crt;

procedure addhis(i:integer; des:string; nominal:longint);
var t:string;
begin
    t := DateTimeToStr(Now);
    inc(acc[i].history_c);
    his[acc[i].history_c].deskripsi := des;
    his[acc[i].history_c].nominal := nominal;
    his[acc[i].history_c].waktu := t;
end;

procedure showhis(i:integer);
var b : integer;
begin
    clrscr;
    writeln('=== RIWAYAT TRANSAKSI ', acc[i].username, ' ===');
    if acc[i].history_c = 0 then
    begin
        writeln('Belum ada transaksi.');
        readln;
        exit;
    end;
    for b := 1 to acc[i].history_c do
    begin
        writeln(b, '. ', his[b].deskripsi, ' - Rp', his[b].nominal);
        writeln('   Waktu: ', his[b].waktu);
        readln;
    end;
end;
end.

