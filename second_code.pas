unit uType;

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

var
    acc : array[1..3] of account;
    his : array[1..100] of history;
    t_acc : integer;

procedure addhis(i:integer; des:string; nominal:longint);
procedure showhis(i:integer);
procedure deposit(i:integer);
procedure withdraw(i:integer);
function pilihAkun:integer;

implementation
uses crt;

procedure addhis(i:integer; des:string; nominal:longint);
begin
    inc(acc[i].history_c);
    his[acc[i].history_c].deskripsi := des;
    his[acc[i].history_c].nominal := nominal;
    his[acc[i].history_c].waktu := DateTimeToStr(Now);
end;

procedure showhis(i:integer);
var b:integer;
begin
    clrscr;
    writeln('=== RIWAYAT ===');
    if acc[i].history_c = 0 then
    begin
        writeln('Belum ada transaksi.');
        readln;
        exit;
    end;

    for b := 1 to acc[i].history_c do
    begin
        writeln(b,'. ',his[b].deskripsi,' Rp',his[b].nominal);
        writeln('   ',his[b].waktu);
    end;
    readln;
end;

procedure deposit(i:integer);
var x:longint;
begin
    clrscr;
    write('Nominal deposit: ');
    readln(x);
    if x > 0 then
    begin
        acc[i].balance := acc[i].balance + x;
        addhis(i,'Deposit',x);
        writeln('Berhasil.');
    end
    else writeln('Nominal tidak valid.');
    readln;
end;

procedure withdraw(i:integer);
var x:longint;
begin
    clrscr;
    write('Nominal withdraw: ');
    readln(x);
    if (x > 0) and (x <= acc[i].balance) then
    begin
        acc[i].balance := acc[i].balance - x;
        addhis(i,'Withdraw',x);
        writeln('Berhasil.');
    end
    else writeln('Saldo tidak cukup.');
    readln;
end;

function pilihAkun:integer;
var i:integer; k:char;
begin
    if t_acc = 0 then begin pilihAkun := -1; exit; end;

    i := 1;
    while true do
    begin
        clrscr;
        writeln('Pilih akun (A/D, Enter)');
        writeln(acc[i].username);

        k := readkey;
        case k of
            'a','A': dec(i);
            'd','D': inc(i);
            #13: begin pilihAkun := i; exit; end;
        end;

        if i < 1 then i := t_acc;
        if i > t_acc then i := 1;
    end;
end;
end.
