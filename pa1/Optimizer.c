/*
 *********************************************
 *  314 Principles of Programming Languages  *
 *  Fall 2014                                *
 *********************************************
 */

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "InstrUtils.h"
#include "Utils.h"

// Function Declarations
void handle_folding(Instruction *head);
void handle_simplification(Instruction *head);
int is_op(Instruction *instruction);

int main()
{
    Instruction *head;
    Instruction *instr1, *instr2, *instr3;
    int opt_flag, opt_calc;


    head = ReadInstructionList(stdin);

    /* ---  FIRST: ALGEBRAIC SIMPLIFICATION PASS --- */

    if (!head) {
        ERROR("No instructions\n");
        exit(EXIT_FAILURE);
    }

    handle_simplification(head);

    /* --- SECOND: CONSTANT FOLDING PASS --- */

    if (!head) {
        ERROR("No instructions\n");
        exit(EXIT_FAILURE);
    }

    handle_folding(head);

    PrintInstructionList(stdout, head);
    DestroyInstructionList(head);
    return EXIT_SUCCESS;
}

void handle_folding(Instruction *head) {
    if (!head->next || !head->next->next) {
        return;
    }
    Instruction *prev = head, *current = prev->next, *next = current->next;
    while (current && next) {
        if (prev->opcode == LOADI && current->opcode == LOADI && is_op(next)) {
            int first = prev->field2, second = current->field2, dest = next->field1;
            prev->field1 = dest;
            if (next->opcode == ADD) {
                prev->field2 = first + second;
            } else if (next->opcode == MUL) {
                prev->field2 = first * second;
            } else {
                prev->field2 = first - second;
            }
            Instruction *tmp = next->next;
            free(current);
            free(next);
            prev->next = tmp;
            if (prev->next && prev->next->next) {
                current = prev->next;
                next = current->next;
            } else {
                return;
            }
        } else {
            prev = current;
            current = next;
            next = next->next;
        }
    }
}

void handle_simplification(Instruction *head) {
    if (!head->next || !head->next->next) {
        return;
    }
    Instruction *prev = head, *current = prev->next, *next = current->next;
    while (current && next) {
        if ((prev->opcode == LOADI || current->opcode == LOADI) && is_op(next)) {
            int new_value = -1;
            if (next->opcode == ADD || next->opcode == SUB) {
                if (prev->field2 == 0) {
                    new_value = current->field2;
                } else if (current->field2 == 0) {
                    new_value = prev->field2;
                } else if (prev->field2 == current->field2) {
                    new_value = 0;
                }
            } else {
                if (prev->field2 == 0 || current->field2 == 0) {
                    new_value = 0;
                } else if (prev->field2 == 1) {
                    new_value = current->field2;
                } else if (current->field2 == 1) {
                    new_value = prev->field2;
                }
            }
            if (new_value != -1) {
                if (current->opcode == LOAD) {
                    prev->opcode = LOAD;
                }
                prev->field1 = next->field1;
                prev->field2 = new_value;
                Instruction *tmp = next->next;
                free(current);
                free(next);
                prev->next = tmp;
                if (prev->next && prev->next->next) {
                    current = prev->next;
                    next = current->next;
                } else {
                    return;
                }
            }
        } else {
            prev = current;
            current = next;
            next = next->next;
        }
    }
}

int is_op(Instruction *instruction) {
    return instruction->opcode == ADD || instruction->opcode == MUL || instruction->opcode == SUB;
}
