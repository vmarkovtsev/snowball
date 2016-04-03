#include <stdio.h>
#include <string.h>
#include <uniwbrk.h>
#include <unistr.h>
#include <unicase.h>

#include <vector>
#include <string>


std::vector<std::string> tokenize(const char *input) {
  uint8_t *uinput = (uint8_t *)input;
  const uint8_t *pos = uinput, *beg;
  std::vector<std::string> result;
  ucs4_t uc;
  bool in_word = false;
  do {
    const uint8_t *old_pos = pos;
    pos = u8_next(&uc, pos);
    if (uc_wordbreak_property(uc) != WBP_ALETTER) {
      if (in_word) {
        size_t len = old_pos - beg;
        uint8_t word[len + 1];
        memset(word, 0, sizeof(word));
        u8_tolower(beg, len, "ru", UNINORM_NFC, word, &len);
        result.push_back(reinterpret_cast<char *>(word));
      }
      in_word = false;
    } else {
      if (!in_word) {
        beg = old_pos;
      }
      in_word = true;
    }
  } while (pos && uc);
  return result;
}

int main() {
  const char input[] = "Съешь еще, этих Мягких бело-серых(!!!) французских булок.";
  printf("%s\n", input);
  std::vector<std::string> words = tokenize(input);
  for (std::vector<std::string>::iterator I = words.begin(),
       E = words.end(); I != E; ++I) {
    printf("%s\n", I->c_str());
  }
  return 0;
}
